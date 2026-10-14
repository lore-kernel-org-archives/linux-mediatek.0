Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24D4CC6B30
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2026 23:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MVSX185AgSrbI09fOTWvij79MrTIRjbwy7Bb3zRoM0M=; b=yfZ7eI8whstqV147kUsXaW/yAO
	CyJZkLIAq9BBZaC4VATa3j6jIE165zGkMTtPcu0OFwTLXtYg5OEmfPMqC6N8D1/TMutLBnAzHfj+t
	zaVDjurrrOcIXuOJuWdLWf2Qb6NPQt5Mb8qgCz0t5EHhxZt0aMvMPsbGsukJVS4NqC2hSm1NFTUoF
	5GY4X29Mv/kbhpXqQmDtZr7czt7IsQGQF+SWtufHeCi6X2eb+O73suscmeCSe154yBv6ux3iDghXh
	d3yVX0jwDkWVDc8U1yQBQGEbSjBAvzGNPNHE+7AGsT4v+qxVUWlDn2KZOq7xg4Wen0NASVmUg72q7
	H4Viq6Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH8gX-0000000GSzV-2rmM;
	Wed, 14 Oct 2026 23:47:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH8gV-0000000GSxp-0be5
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Oct 2026 23:47:00 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EGZsw63469372
	for <linux-mediatek@lists.infradead.org>; Wed, 14 Oct 2026 23:46:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MVSX185AgSrbI09fOTWvij79
	MrTIRjbwy7Bb3zRoM0M=; b=aythbRuDEL9m8f+kyN/1bOuBhBunx6ptFyZh24so
	rRCqeRzuKYYbiLbOs6kD72uXjQwEW3Dqd8DxtEhsF9/XIHWGDqmEN6cm5TznYK2g
	sARAAaLbJKes6c8FwRfRsDtIuTiXypv+LGPMtcI+pVyt3WJIjua3auH2ULzxC/34
	INJiqzMF2kIwQqDCsc94H5C5ndTcm56ptcdxs2lJEs8DioRFpRvva4nThqIKojEp
	j5ay9f4VU6s7nvhnTm55iXzMJq9fJNjfUsmcImMLpMVP0jWQulTTFJW8JwAs9va5
	wFNVnKRjQd2f0zx+ByYY7iEH3VyZsZ3njjPSO0xESp+INg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hadd79esn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 14 Oct 2026 23:46:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc0b31ecaso206021285a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Oct 2026 16:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792021617; x=1792626417; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MVSX185AgSrbI09fOTWvij79MrTIRjbwy7Bb3zRoM0M=;
        b=hWASRhtLJwlNSzDUUICVB3pbU0iSkHIXQMpkdJsCVG77Td1IhQD25ZhRqkyzmyRQZf
         tm2Im9LhQoaXkgcJOI4mAJn1L2QgpmW16cvp6HNxk+xd260EIgrZDAvsOkOfhGdSaiX2
         nUlAy8BbGAwutljbzuqPal+N9ZY7RrTy93VCTMzs0uQZGNy4GE5WxOHz74D0XlQ6DxV4
         kHcStoN2lZ+nhVHhzfk01GMlaN8R2BHXE7B3WTyMy/XzsJX29Y5XMxn6dg3sD1ldOTK7
         oHmbf1G3cHD+tqTKR/RPfy5zgtXrXjaUv4YVDrw2P3j9F3l9vPuyJZeojlxDLWXfB4sg
         sqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792021617; x=1792626417;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MVSX185AgSrbI09fOTWvij79MrTIRjbwy7Bb3zRoM0M=;
        b=uzY8TAvgu7RyXr3zFyI5a/5ajejMpzSIOsL52tKPIOikuxNEfVyROcCgCd4BNf7NKK
         lPUTYmjYEi9GWsVfMbtRwtj1l7zDmOVohSlOVOO4DDvjhAhkTSOEzErnz7lw9lQJwCyk
         cft6/el1LYREdt3Ovg5QsJ40TyFLB5s1zjVAnWO9DK9neO2BM52dLcHpD/sVHKJ6Igdl
         QGZUEvA7rmKUrlWUJ1jsC+gtrVmi8LHERdTlAOycDTEHAnfsJO+xBzMYpTCOfD8dc+g0
         /lYdL8lWmM94oPyE7751LQnoO8dvHhvX49D3gunumnNFGFM/sO30/68SedG+Eaz8zu7M
         1epA==
X-Forwarded-Encrypted: i=1; AKwUvBxzymg86A8jfP0OHpjTjr8KAoocRDZGGnniBoMxg8wpHzGQNR+3SYvzlV9BKF9u23cTJIWoaf0RjX4RTrsPjg==@lists.infradead.org
X-Gm-Message-State: AFq9FYLxQU9ntXsfSMTiAg+rKUT9CECZrhE4f7HTZMQcQYZb9f9f750M
	R9LJu3HgN9PjpHys2wqqEnK0w9yrwMt0uy8Dm582lZP9D7q1hoKl3X9wGiL2yJHB5gjaGfqC+oY
	FiiN9Sz8TYIE1SLQsl/mDlFqDnj4Qldun+S9u9QhJPcKIylVhi1u1/nqShvcmCKJr5cciqkOy6X
	HIlVwLAPI=
X-Gm-Gg: AYBFou0MR01E6A1Ml1ZOF2AZliuzFReK0n9AbCFCO91CFTryyCCcaBh3TXl+5KTkoom
	KP5/Fh7/wrD3bwgRyI6THFemzNjS40IQzWgKzMgap1BO/3lUrsC9wonORqDR2QbfNVM5QIxUeaY
	ahYQQOc+l2O4NkM6UvdD8GqfcLyQ4d7XAgenCl4yyAxSZJRWaxEkY3fvG1qkF/NppVWM053T2fh
	vMvVAiY+K7nItQ2fS4NfMYp3YItVOR7OaNhV1Nc+BSwyOUC1sBkHM2X0TzEX3/FvVk3zVpGS1qG
	LnYEFEGqaGhpcHAqul+ZtoHGgyz3TMpS44kNwjpLfW1ghex8UuhOcFx3qDfPuMwR7dKHooxD5bl
	C+jfyyJDNUKdAWHt+cnZKokxYZsRe9YXXVis1rRISac/htx2QZ3AA028Jawo98JFv76Tul2PJzS
	X2Un3lLmGgYSsE
X-Received: by 2002:a05:620a:2701:b0:93e:d364:c9fc with SMTP id af79cd13be357-93ed364eb53mr2144273585a.5.1792021617524;
        Wed, 14 Oct 2026 16:46:57 -0700 (PDT)
X-Received: by 2002:a05:620a:2701:b0:93e:d364:c9fc with SMTP id af79cd13be357-93ed364eb53mr2144271485a.5.1792021616901;
        Wed, 14 Oct 2026 16:46:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d973f7sm934666e87.70.2026.10.14.16.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 16:46:55 -0700 (PDT)
Date: Thu, 15 Oct 2026 02:46:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH 3/4] arm64: dts: mediatek: Use DP AltMode defines
Message-ID: <woavboapzszyqhm5qrlca3iqrlq33j3ehy4u4mxsib7emre7yx@4mvuaqk72nj3>
References: <20261014-dp-altmode-dt-defines-v1-0-b657c9b6e4c3@collabora.com>
 <20261014-dp-altmode-dt-defines-v1-3-b657c9b6e4c3@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-dp-altmode-dt-defines-v1-3-b657c9b6e4c3@collabora.com>
X-Authority-Analysis: v=2.4 cv=BaVNQbt2 c=1 sm=1 tr=0 ts=6ad01472 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=M1rqeeilqGQJneHCTBQA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: lnW6SFNmyca1RDiXMXjWLoemSJqWmoe8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA5NCBTYWx0ZWRfXyIsPN90Qymgv
 OaGl5JV5fFUaC+eh8lXkzPacYLHp9AgDUJz/moq/QZnVnp/nyvWPIRhp2tjK/HM0eD1UOoJwflQ
 demonLObs2D168Nsu7w4BrJE97RwEvLsp5EggFnrwCZGxp4wYrmNTFjKEGMwEleLNcSmsaV+0dA
 ovKD5qsU21qdiNTAvLkT1qteVBy0tSehwod99bdIDogTB28eyoYkjkm+OlMC4JRbXnIKeYez78u
 At1R+hY/0NCgFaEwB2pXZ/+edO9MPWZvHxdsbErwKWlv16gsd2AQq0BJ2pPZtOasOEs0sKL+VTR
 GRZZ0DBw9v48wAPtCgYpsLYntH7tUZ0OIPmWBCzSoHtBC2Q1iFtVOJaHMuG0ZnOerDJm4Y4oa3t
 7C4OpWddlAlSGi1Peog2C0WuaDiaSFaoVgd7rDg/w5ISxEzo8XKyEj1dl1lBmUQE8TScf6nzhE9
 ENjrszFldaHoRTlad+Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA5NCBTYWx0ZWRfX/l5yLhtzuF7H
 Sj0lOmoLlzO3zMQece9iM/yVn1yzDmkCZdYQ8oeLbTW2w/1sThVNEFRMI0+P75c8+G18r79cDCk
 bS5YT7adEIIiWdolNheE72Zm31ujMm8=
X-Proofpoint-ORIG-GUID: lnW6SFNmyca1RDiXMXjWLoemSJqWmoe8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_164659_199774_0AB15FAA 
X-CRM114-Status: GOOD (  16.51  )
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

On Wed, Oct 14, 2026 at 11:31:51PM +0200, Sebastian Reichel wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Use the new USB-C DP AltMode defines for the SVID and the capabilities
> VDO to make the DTs more readable. This also fixes up mt8390 Genio
> platform incorrectly announcing UFP_D (upwards facing) support. This
> feature is unfortunately not supported by the SoC.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi |  8 ++++++--
>  arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi | 10 ++++++++--
>  2 files changed, 14 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

