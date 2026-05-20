Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33514CD4F3D
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2026 15:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aCb65PPgVcRobY0yH5IOaSFWaUsgF41FkRsrX3Cll+M=; b=tO2o9wOlmoVkZbo4d6jXwxEJLP
	47TNWMNDkV7HekjZqIZnbML/X+haX3lTKCu2/wqKFIG1cgEUcVIUfRuIDuRqbuPh89C61CDZwEThl
	i9jtLTTJqiVWakUXdr+bTti5DbtcMT85Z2z0GvgDNASruu6PYuExHvMz0p3hdVo2szgAL7WAhGBNO
	6DYbDNwh/WQxQd5eP4xxI8EYAOKOQ+PAbD/ow2kM04ugn0/SJxtH17tz1kmm+NlerQggGS7aElols
	YTWAMDjX3p6XWP2kWVsxPExmnOIHn9nn5aJBSEXtQJHz3iZktTdEpMY330qUVfK6j2vErr4iR8b5t
	hiPn6t3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPiws-000000051UW-1Lpa;
	Wed, 20 May 2026 15:35:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPiwp-000000051Tm-2dlW
	for linux-mediatek@lists.infradead.org;
	Wed, 20 May 2026 15:35:04 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KFMOZI4115217
	for <linux-mediatek@lists.infradead.org>; Wed, 20 May 2026 15:35:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aCb65PPgVcRobY0yH5IOaSFWaUsgF41FkRsrX3Cll+M=; b=d2sGmmerqvMmdFQh
	BICjFbRpkZtg8XA1a0GfQ/DqoV24Fe2dZyAiEeR/7ZZRJCXRwDpQbt6kdwFMcWWy
	YJQZaRSMc1PIMCPZEPlmPgOXtd4WR9+yPj8Z/pJ6WWVat3y4/YAeUWnVHITP57H0
	xJS7hqDkruXeJ0rFNTh5QtjmfRCuqF2YCFQ9Q0jd/NfPxVhegGlo3/2vYqpoJLg7
	ll2CLT7biH7kqzzv4/zeNdIZCpFNWGONgCIAks9fnvO5H6ERW/iClGzcmN4nWeic
	inZRKXYKxWk5IYhwuuc07eDLuwd8zL8iKkVNfs1D0ORVGzWFfEwjEBE5CowVMQhh
	DpbPFw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e99w0hgsx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 20 May 2026 15:35:02 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6313385ca1bso3039264137.1
        for <linux-mediatek@lists.infradead.org>; Wed, 20 May 2026 08:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779291302; x=1779896102; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aCb65PPgVcRobY0yH5IOaSFWaUsgF41FkRsrX3Cll+M=;
        b=ItFCzvGIenFNZd3fLmSUE43s5Si6YKPZhEQLSD3knK/iELfXhVLEzi0vtECSZRwsUl
         szK5ErSVRAS76YEyNxZ/zHxGM542kBD6iR9AJYrJzvC7vGzxiKMKt5dQOCfN3HgjaZNq
         JfgzY33WQuyGgMY8Baa6ynBZmR/PscdkmFpm4iFfvyqF1Fh2H951Z3DWwaYj1NCiB6iT
         aRAxVyx0vWWwg+uJ2IqKjqMbqrekejXq+7m4u+DIxWxW6TMr0sn39eNcCeqeC/yv742f
         wr4FzpWZlSWTbRlqFJD6BmuwlD5kYoYIp88+DiUBDucHXateavBO9xVvo7MfPFmQxY2x
         d/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779291302; x=1779896102;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aCb65PPgVcRobY0yH5IOaSFWaUsgF41FkRsrX3Cll+M=;
        b=UJziObmbhfEcJTLEiVcHuEptQzitL8q+3zV3J4d9NG/1Vz3zXsK84K3xEyfDJYWZY+
         Elk+HLYP4stmEqGSOB9bmjt5kryYmE17EW4IM3GEM7992/Np3Eiqnge55N/xCMcK13ZA
         oMr8j69u+OCaSD978U6fTq8oEPF2PFpfY4fJriMCH4jO4fZCSHZz6hT9ZLIuT4AX0uRC
         VfIHnTwZM4a4xdEM6hKYIC4QeCY/MDRPzfqZqdQ9dm+YJ+mrDODJMh8JTzggi/0q3l2c
         /be9k6xmoOop38kqRbugWAJ2vgPUtbcsu1sHlFyAaRRxdL5213A/cdYB3dRP9ioTRVhA
         siZw==
X-Forwarded-Encrypted: i=1; AFNElJ+4gKQ+5C+lI3zy2YzY8FkrtyMqa2G+QG0sb3ub51sO/0q55VAM3uPqQK0f5zizmnf0NZYcuTS6avByr4B+Vg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxsG5qj8C7hwpabP+lR1AXo6LhERpjDTITXA9evC680ULlW9TWA
	/DRYWQLI+EQdSO05RNpqd1stTJdsQsImEQAtEglQciZ/iiCInyP0LjhTa8KBCkPrsmnyrxcAs2j
	MbkOivKkNcsZfm53q4I8fzto0LXqlCARiyYAWNXAo7mzv+OKOdKM1zcoPwxvkoFHBbrWSm7C/tf
	U=
X-Gm-Gg: Acq92OF6j2zXAl/Q1ZSvXFzTtCiRjugW2IxJPg1C5ABhS97+8P+kUF5RONxvFGkwAgf
	vhh8E3ux+042r8VyuVpefx1FKj5o+V1CAXBMyYyyqKI6Cxg1HoGVycnAJGe45Pm3SlRp2LLXVRd
	rMxGakzj5uj+S1y/VABsA3w6hG/J/XcLR6U/ixvwBdTDkpBR4Qs4amEQldVLq9H67HK/UeHzsS6
	xfUMbFNbuIwRKrz2Mx1Ec9C239U+Io6pKbMIZb8ZIzz27sxP/k6ebnC2ILiXl26u8Cz8rrl73nv
	Xt+kDf9fBfKDJtqF8xy91KFVeZVPnFfEHPA3ipB/qrRlftHGP6tS66xeAld/u1GyjLzyYoPJPsK
	foTFLlahwkHjaO7ecSh8yb0UqOZ5oJLGJGXPc6jeWlmc+A2jl4ZTPiaOhnxI=
X-Received: by 2002:a05:6102:598d:b0:633:2389:3a84 with SMTP id ada2fe7eead31-63a3fc964a2mr11421067137.24.1779291301936;
        Wed, 20 May 2026 08:35:01 -0700 (PDT)
X-Received: by 2002:a05:6102:598d:b0:633:2389:3a84 with SMTP id ada2fe7eead31-63a3fc964a2mr11421006137.24.1779291301435;
        Wed, 20 May 2026 08:35:01 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48fe5cab818sm421761775e9.14.2026.05.20.08.35.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 08:35:00 -0700 (PDT)
Message-ID: <81b15533-3258-48a8-8d5a-0dcec7027254@oss.qualcomm.com>
Date: Wed, 20 May 2026 15:34:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: mt8173-max98090: use standard callback to set
 jack
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        sharq0406@gmail.com, kuninori.morimoto.gx@renesas.com,
        ckeepax@opensource.cirrus.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20260520132930.54333-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260520132930.54333-3-srinivas.kandagatla@oss.qualcomm.com>
 <5990fbb1-286f-482d-b02a-d0637494f435@sirena.org.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <5990fbb1-286f-482d-b02a-d0637494f435@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lyAU42fobIscsZAYI_7oZ4hX9V-_04yD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE1MCBTYWx0ZWRfXzOFJNx9Ff7qx
 FubNhST9dEiYsyZfLm9BD/c/1kfC7JGd8QHKyREUx3EUHCpZt+dLeCP/3/g+3RYvtRchXWA89ac
 5Xpt2HakrHbAFOzULoJkwaDcLLNanpEAog/Hb2eFO415q4RilSEOBmpjKgtGD2Llgx3DhwFdhRg
 vO2UXcMgrEOyvJpo9huosFTJYJIbrfz6phfC/pFK6kj7CloPuh8WjhotkVIOZEKDpjNOvQkRYQM
 c8wB+CMNtrDKibuQGmIf8DPllNB6KeXW86uJ07WhwjXCuKv2fMOd5vg+llBZBxOG0OYFhA+6YU9
 zR6V8zjnxfo0iMdWdOC0Og7NQxcC28RmOVDp+GYuJD9/zemCRw7ncEsTwKqkQdTbUhDfujaVExJ
 5ob55IPdpDOKlPbnOytyf3oeONfX5p4yqKjZVs/HclaWWKj7/tdpYidSKKx6nKcfO04v0R3nVaN
 JGZIz8FrQT0dsL9TtyQ==
X-Authority-Analysis: v=2.4 cv=RZigzVtv c=1 sm=1 tr=0 ts=6a0dd4a6 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Zl4mUG8r6ouv1iOMoRsA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: lyAU42fobIscsZAYI_7oZ4hX9V-_04yD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_083503_796190_A8C3C734 
X-CRM114-Status: GOOD (  12.21  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 5/20/26 1:42 PM, Mark Brown wrote:
> On Wed, May 20, 2026 at 01:29:30PM +0000, Srinivas Kandagatla wrote:
>> use snd_soc_component_set_jack() instead of custom callback to
>> max98090 codec.
> 
> This needs to be squashed into the first commit, otherwise the first
> commit will cause a build break.
I had them in opposite order in my local setup, which is why it did not
break the build for me, I can send out a squashed version.

--Srini


