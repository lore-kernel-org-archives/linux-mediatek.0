Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15375606CECD
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 17:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F5xx8aZR;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O5Y2iAae;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YLzBqMNo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=03h8Stqm2jiHP1ePJ8/GT4xjXmJ9AokgbaM3KsJdgkY=; b=F5xx8aZRHxKhDQ
	68tj+WTHBl/YL3wAy6WveesX3ZJG6tqWW1ylVRXgbjEz94AShwJB90DSGH7oJqYZSxxcQ934RjxLC
	R3ANqxgj4RIoCf73RF/lHOHsY9eQGQaFVVRf58HMJ1j+KMxFcLHNC4khE1qkhKVNtUpj/5G3utDYQ
	M3wzJdlWeAq54d0pOf68GQ1rflFdYsXTmLMMqjDGQE4+iWYKRgV3Th8Kbu745QCTN4lm6mBT7WeJX
	ayCZgJZ5vObyiDDdKO7SIFKcpc7eWvMYEX5nhcYykjBlPO9C9UE+VK6U0bnZ4PIU6IS9FjFLdq0YD
	QlfrAPNpWTk4+lIyJj9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvNW-0000000Dmlc-3BmS;
	Fri, 13 Nov 2026 17:47:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvNQ-0000000DmiF-0C3h
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Nov 2026 17:47:55 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRT2R533308
	for <linux-mediatek@lists.infradead.org>; Fri, 13 Nov 2026 17:47:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	03h8Stqm2jiHP1ePJ8/GT4xjXmJ9AokgbaM3KsJdgkY=; b=O5Y2iAae3vxsFE5d
	bb/rkn64PBwYsEBMSAwKJaK6QUBOzvaT/JN7Sw+WKNElb9GGov+5+qBGIPt9dyjI
	UOCX/5yCyKcW57d4cg6vRl3v16ZA/YI1s+lltrHyx/sP7shs3NV680IKYwiZwKC8
	wKhWXV6W2DUQI4X61efRhfgyLDseWAywprIqlnavRxUKN8d86RxDtCnyzHgDpEYi
	J/0TzccypLE2Bd4fWDQ0AVjoaNovbbww1x1Gltu2UrkdksM/l+KLy9noKBA4e5Uv
	XfGLWfvUT9lt2CtF51P+LQ7LTBgxktLEPpwWiOSETJNQfotta1ir+bN4jfUT8Nzt
	FzxYSA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvjaagth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 13 Nov 2026 17:47:51 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b930598cf0so1775531b3a.1
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Nov 2026 09:47:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794592071; cv=none;
        d=google.com; s=arc-20260327;
        b=nGBgssmi6AJ1Jl1NNuqJcr3+gILDsgu4O+RaboOi1ntUYn/kCwdX1PYTiqKc84X4LQ
         HgWZKa6lSrwN7ckSRj25cOUmiPoWBXhnJADEmaQMABuMgm32RuNX2jMYdYrcvUN3jCy1
         Eq+jJxTGpIOvA3i7lRPrVI9QcZ5pDs6+hCA+WIsBvFuKYn9CeO8PgllrRxn1b+iqwWdV
         BfH9qdPW8DjJuKWjV9+9p+WBeMwzTzKDRB029zb3XIU0bAsRMQpiKsUA+g/01kpBkmGg
         +LCOjWVSNahorT/WFmM2gJq2SM1f77gmsRv/64hxqe1wpCns41fq3/bG2cjBsWWE6aOM
         5wbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=03h8Stqm2jiHP1ePJ8/GT4xjXmJ9AokgbaM3KsJdgkY=;
        fh=TXbAHNFX78Ln104fsNZHgVTeGGHUJNO5XoqkBJK/PiY=;
        b=KQaXcKyLRvOeqaidTX4V1DIl0ND1sfdbqWswj857O21O7Tt0Vhi5DcXcfsgwJ6GPMI
         L7wAIFqXFIy8Nb/WReKfMDQnptmvQhrWaU1Gj0TXQ5KH3BEtRMa3rgMpHjeg95Tbx/Ig
         /TRItnocLtckDgXP7oZIonX+DupbzjYzeM62jX2KGZNIjoPobXXcKLsK7JB2ZRIiQUFG
         EDzE2ysNTtP/8DNgVukOxwbN7LMnlBnOguSjCbHLdp5ml2gaOZ7RKkPRpncZQHNXT85A
         RnPIyWiM7VCzD8ePOza/r5h3HM1y2dRsqSdpAWd6cqVZNCUcwVImnj1Y+bu43Z5zaliq
         Rryw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794592071; x=1795196871; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=03h8Stqm2jiHP1ePJ8/GT4xjXmJ9AokgbaM3KsJdgkY=;
        b=YLzBqMNo7SWGl64WNtmNTiPOQ4sS+lAux4G/TfPs6xZoqE/rXTG59JQ130j4yeHcGN
         zv4zk7relfU+uSWk0/iQf5n8R0QqhQWDJUvxdywQzBng6t5pZQab6G7eZh4Jwwy2esZr
         expwLrN122Bpmo26enPimNmAjJoVcgReaMy8NRvhXp1d2/ZO3DitJ2uAtbpURYx2db0n
         SwaEcynlsMtm+BfvkZdtgI4Dm8hHK7kVvBmg1j64FYdCEp74abkdijnVyISLajbwoITM
         R3gTYivqIqjqcLuLT/2qPGHODJBB1uXCixmUeMhrapassRzU0mZpQkJGH0X/YqQGyEzA
         0EBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794592071; x=1795196871;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=03h8Stqm2jiHP1ePJ8/GT4xjXmJ9AokgbaM3KsJdgkY=;
        b=HJsZPTc/XoP6qchbtBigEuktFZAABaDzDD+33c3g8G/z6h1VSeR7uQeYzSkpTQG55d
         xleNw4uSNYG63lyWlaNFVycq16I/rYP/b3NSSW8ntKOuXaW/oXOc0AClkPUovQoqiPrW
         oZGbhIpWtIR8EBKPdctynnKdevSOSvSrWbCXfJAppzEQIknE6o0lkZm5xw7rWFKwCp7w
         iTqxIDJ9X/h6ytcEyirf96JPiiC4iBN2ARlqActuhWN+pWJPsyCQuIBuaoDPpMMAhv4E
         vnzFVnYayJ8UL6G6pmCTHAtBARgRZgGGs0PdOHq3sdNe5phVTDbrZrY4nLK1lXQZpSEM
         viIA==
X-Forwarded-Encrypted: i=1; AL+hErE/1LEQZIz1CDOmuRcUH6E+pnyJnfh/l7/zy4jV3RNA7FudtYVDTZzkcvr+PghtquoQNhNgYGuJMPrcJKSV7w==@lists.infradead.org
X-Gm-Message-State: APuU4Z9pzvns5vEqwmI/rb3BQhKy/QzZBURk7FA7/XOYuvChUmKDJhP1
	1oOdQ2JxhRjx2eHsgecYVLwKNCMZzHMFJYUAthlP9QBB4Z+xAqEliOVc1PdBZBuQqus2urh/RjA
	bG7LNegvkuIXHojRgILQeNidNfeXTRZBjJitWYzK1FZdkuy/P3o4bTexbTol9d3PIpmTR9TDGbZ
	rctGOiMgklJ7u8xo8z0c5xlwbnZxAbiNIg3GpOIZEzedMXBLmgpNLX+W90pw==
X-Gm-Gg: AYBFou0R8tbTRXT9fhTE/tdmurcHMyAv4K4xBeakwUFd/40BRUb2YjNFV8QJ1SI7TQW
	Mo6T7rTYr6Pnh96l20q+vrs4f4IShaYpQqq/YyRcUdVQlvdhH7LYj9AlbhBGIwL7dGHmxIQB/yy
	BZnk+HZL9Z16za9EQxDjljBwrtN/MLaxoIh6PEYKSNkO3j9e+l0jmAmBVBWg==
X-Received: by 2002:a05:6300:67c7:b0:3ed:b2b6:9bdc with SMTP id adf61e73a8af0-3f7a81b6293mr3316949637.54.1794592070847;
        Fri, 13 Nov 2026 09:47:50 -0800 (PST)
X-Received: by 2002:a05:6300:67c7:b0:3ed:b2b6:9bdc with SMTP id
 adf61e73a8af0-3f7a81b6293mr3316931637.54.1794592070412; Fri, 13 Nov 2026
 09:47:50 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019-pmdomain-mtk-mt8365-fix-defines-v1-0-dfd445dc3763@baylibre.com>
In-Reply-To: <20261019-pmdomain-mtk-mt8365-fix-defines-v1-0-dfd445dc3763@baylibre.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 18:47:39 +0100
X-Gm-Features: AclHuK8NzVs_OvZcfoqmQEpBpt7jEXwt_UF2F5ZEs-xe9awuz15iknhP_y45KKk
Message-ID: <CAPx+jO9wAPreJr5Gt5CVFqb=E-hMjQnwRWwdnvpus0MObio4nQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] pmdomain: mediatek: mt8365: fix defines and add
 missing one
To: Julien Stephan <jstephan@baylibre.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: Ai-Op5iyqhJould_raFpoY0sD6Zpg5tw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3MCBTYWx0ZWRfX2aOliEGZ9kNf
 vAlFLcyWnDphekPVRjj6dNaU91bJA0PG0Ce3PyKZ1CRpAMGHW4htvE/8r4wRZlGKuCtWASPw9BU
 r/Vltjm6+FcifeAsT8W2uuLsgK6OHbc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3MCBTYWx0ZWRfXzWGTRUvut/zS
 cJw2yRq0EiopjQlCe1mqLbomoe8UrLirXeQNUlRcV0PfBrccXCmNTILD3mwo48BO67fA2KJjxS1
 hMASxTLpXB0mWjMWAF3u98qS/cTPmTU8lmTG1eOBbKBwWsXck98PcgVVHyMHD8WZjcOxhDWx5QZ
 Zqpc3BhzNsXTQWodHcXw6LdTKzGUZQixQv5JgiNbBjOpUCN5oFo6Rb8EQlm5ZxIpmGY6XabeWwT
 Ke5C0RM7GaNoV0Xzg693pTkQGvePsFzsdATZu8Cnu0DLZSN+n3Ii1wa4zsjnk6JDeEBRAJoal47
 W5jAA0t+YYDkQPld4o2Sb4HSBtYDfLFV8zi7iw/HB2flInI31Ebh1XWxObOoR3HQfXbbTfu1nb6
 ikitJbok5jhwydXl7nSsnAQGesAvjwfc+PR0rU2J8FAPm1JLnSt4YRHPEZXlfa01LeoUy5ZLisF
 2wd1Sm/9adp5xbj3x2Q==
X-Proofpoint-ORIG-GUID: Ai-Op5iyqhJould_raFpoY0sD6Zpg5tw
X-Authority-Analysis: v=2.4 cv=AoN7T+9P c=1 sm=1 tr=0 ts=6af74d47 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=IpJZQVW2AAAA:8 a=uk3U7i1IYnWYCnW-BX4A:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_094753_855317_D16E63E4 
X-CRM114-Status: GOOD (  17.31  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 2:33=E2=80=AFPM Julien Stephan <jstephan@baylibre.c=
om> wrote:
>
> While trying to add a missing define for BIT(25) in
> MT8365_POWER_DOMAIN_MFG, I realized that the name was already wrongly
> assigned to BIT(22). Trying to fix it, I also checked all other defines
> for MT8365 and noticed a few other mismatches between the defines and the
> datasheet.
> This series fixes the MT8365 defines and adds the missing one. While at
> it, also fix some indentation issues.
>
> Cheers
> Julien
>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
> Julien Stephan (2):
>       pmdomain: mediatek: mt8365: fix defines
>       pmdomain: mediatek: mt8365: add missing define
>
>  drivers/pmdomain/mediatek/mt8365-pm-domains.h | 11 ++++++-----
>  include/linux/soc/mediatek/infracfg.h         | 21 +++++++++++----------
>  2 files changed, 17 insertions(+), 15 deletions(-)
> ---
> base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
> change-id: 20261019-pmdomain-mtk-mt8365-fix-defines-c6be65ffca95
>
> Best regards,
> --
> Julien Stephan <jstephan@baylibre.com>
>

Applied for next, thanks!

Kind regards
Uffe

