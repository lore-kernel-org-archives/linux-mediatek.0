Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A38ECC6B2A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2026 23:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iGsSHjvhagPRXiAvKSbTu3/SaEhQGd0uTphQRGhmwdI=; b=H0ttaKdqnd60ytibN0Q2Hr0IRo
	ZRPYsPbpAd9bnkS9He2NbekOyJ+TMWNH78mI9+7viwt0lQsI3YZoS4dp4fKjVfUZSTYX94sgJRJe1
	/1Hrfhf7OAhOKXzQVSvrWUm7RhzMXvJEK/B9LyCr2Rv+kBeSg4gGvYkENB+I6S0EebaJJoTNP/PIX
	x804+wgnMuZ7TTEFL02o63yWSl/d/K+dcqSYy8Ct+PPrelD0oRADxhUHIeaXp4kL5hNSCfCt+Ozyx
	0XR7J6AWa+LxhpxAUajzIwp71QKqOQb9deA0QfSuGY4Ju93Ox6tVK80q4xl621bK9vSDzlMFpooQq
	805nDlZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH8gI-0000000GSrT-0fPq;
	Wed, 14 Oct 2026 23:46:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH8gG-0000000GSq3-2LiZ
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Oct 2026 23:46:45 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EFMm1A1682677
	for <linux-mediatek@lists.infradead.org>; Wed, 14 Oct 2026 23:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iGsSHjvhagPRXiAvKSbTu3/S
	aEhQGd0uTphQRGhmwdI=; b=JxiEO0CryCiXsww03jKFnqlfHqxReTyDdp5kUXLv
	QULPpT3bTqj+lWLIHihri1ovAEzk4GyRNwUyYc/O1WY/L399eRXvkjwpN9Ee8tVu
	nhgkYjZjLiTdRDYUVYMLrSBTFDhmOGT3/Y28aeetbLENcyaTTlVKEuXjH7X/WcEj
	K2IOA8BZL0305lUDw7JTpuHTaDg91pAaoVRygueHQaxER3u2nvoE/fUO4GW53Gss
	j6cJAhqRwH7uSPC6qXxRXstO7FEHXCa34JNB7E20gEeMmSBsyrG7ZttvWpI2iU49
	/nvUSTC4mSVM0y+b4hcbwVhZsv2IkP0fgS2FvCf5K0Xh6Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacb01r62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 14 Oct 2026 23:46:43 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917a7fffbe0so107477596d6.1
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Oct 2026 16:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792021603; x=1792626403; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iGsSHjvhagPRXiAvKSbTu3/SaEhQGd0uTphQRGhmwdI=;
        b=HktctQ374cPd+SpyLS3irbTL77aLqlJSX0vC/eE7QhFqAX5xlDBZtvy9BQP5kVkmWh
         lZTngvf2Cny83Vou2DLnSEpegqU0uVnflxuJAUdboMltuXCp0ZHwn1nGhCL4VujhvCCt
         W8cIrDZPhUnzMu5Xt8t7yg4BpCykUUkngpSnQE66In45B1130FntDUElX4wj5WSm4/pG
         1lQiaH+hYDZZg7ZMzVcmai9lCcoJWBDdBxeBZZvGKjliIFVNvlZbAkf4zCZmTH8hsFO2
         +CAILkizYsw27VnU1JI+kCeVtq9cc7Vn6+3hcMbjcYny9bkUAaX25RPgMfwisAzWs9my
         JdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792021603; x=1792626403;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iGsSHjvhagPRXiAvKSbTu3/SaEhQGd0uTphQRGhmwdI=;
        b=xNlO/JeLtcLHv/o/0z+xI/lvKXWpqQzDEbdEQwZxBBEXGINsdqe73nwGu8AxtkZYgD
         8nQcH4qzj+0z6cOwlH3/ra03Hk68v1iUy1Y0sIrTDxKfJWquKgOQ10KeEtRlsfTmj8gR
         /Xg9AsErNr2/LqcNS3jU2mgiG8POqzzefgSCkcLtOWLkrPyI3QMg5R9K8HHPzApMeAuK
         QMSFvRqR5BHT/U2Ntlw4OFBm8rdmJh2a3WAYmN9dN26TWJ2emYzWU7TV1jIZ3Wmy6A8g
         U7I8xXDi5P0HC83NqX4F9kJXcr3mY7ADl2fpC4eTPqmJV5+IMTCh5OVfaI0rg+IXOh4H
         0JeA==
X-Forwarded-Encrypted: i=1; AKwUvBzkG9paqbXCtZgRTP3KiKEQmBuY6+NXfAZjC8tntMT0Ii1Qwr13ZSJ6hYYr+tCaomj+y8cnAOQTT4j1Ui56wQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYLvbJ8fnNPueE8bQiNLM8Xu0ZnPBRErrXQx+ZjX9K8Ngmb3SFDx
	vAmGsIK3n6cW51fJHY2yR8htosMpKbXSBora2e1WC6pxhXyyGUcQUTK/P7DVHconaDKfMbKXypb
	7Zw78PoDRI1R7hSd0Nss7PLqAByI65tHIjTarFcnbjLYK+g4VuyAHqwd64MHHak4eRRRPHPJGP6
	U=
X-Gm-Gg: AYBFou0g3vXL8h9BDV8J6N9JEFEs2byjIW/cxydPszDlr53QexDu1Ugtbtj6dZE4uks
	EjfwolziSHdrF+A6BNR6snMcvOSLIn97T6CfCEdWcGp0U+TzoKF1pCFd5zva+PFVwB+N18554yK
	7Hpq5qYxFsdtAS0BQ8FdkRQSqqwGnxKELS3wLmxXjbeXdMFmciXFvVJjgCEMSf8odUfI5EKrTAw
	SIPfyZ1Vd6k3tAwJDBi4yZQAEUOficflxSEPqzU+0RZ/0UBF6QvvrNoG3AaDfBlsLqfQ5gb6+Bg
	bjuxhfDaDNv86n6wDfHfOwvebsAoPEtUYhHYR1Pe7S4dNyZ3cZIa7iQrQ117I2sEPofiX9t4Kie
	0ByIX7pCaAc2emHcwS1nx8+qoPVZEhAw5lDvg+OqA761/LVc+BqC0n2eoPY7eI6NnWDQYFLNL3F
	otSm08NTCDVl5Y
X-Received: by 2002:a05:620a:2691:b0:93e:a51e:7ffb with SMTP id af79cd13be357-93ebd0bfcd2mr2871710885a.2.1792021602930;
        Wed, 14 Oct 2026 16:46:42 -0700 (PDT)
X-Received: by 2002:a05:620a:2691:b0:93e:a51e:7ffb with SMTP id af79cd13be357-93ebd0bfcd2mr2871707385a.2.1792021602398;
        Wed, 14 Oct 2026 16:46:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d93e00sm939809e87.66.2026.10.14.16.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 16:46:40 -0700 (PDT)
Date: Thu, 15 Oct 2026 02:46:38 +0300
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
Subject: Re: [PATCH 2/4] arm64: dts: rockchip: Use DP AltMode defines
Message-ID: <qgkw2qvqwmchclsdf3k5omanjd7qvm6wyxfjy7bb66w4koarnz@6s5k35dmqvai>
References: <20261014-dp-altmode-dt-defines-v1-0-b657c9b6e4c3@collabora.com>
 <20261014-dp-altmode-dt-defines-v1-2-b657c9b6e4c3@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-dp-altmode-dt-defines-v1-2-b657c9b6e4c3@collabora.com>
X-Authority-Analysis: v=2.4 cv=VKpIDNPX c=1 sm=1 tr=0 ts=6ad01464 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=oov9_tbh0Q946gG9V5gA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA5NCBTYWx0ZWRfX6qu/9N+8ylO1
 1lP9wIk8gNsVA6danLyYc8HcvwJ/FWSXQjpf2xDfwRXK3hQzHenNjBn2QLISIW+cA8rVgtFSqUa
 KqfkMnzbHTuTrtAH4LggWfw3L+qpstE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA5NCBTYWx0ZWRfXxYmkqGxJv5CK
 NnFgHh9GVqaqBmZ41qI3RoBDvC32SxmUF7nFWFXOY7vynwIvI/Ih0D/jbm32Lpf7I/nHSTbqNzy
 yVTYCU+jSIVcSh1+GdSoRXwKrLyM9SpQep9IOH4JKI4Hp1YiClWlhrwbMqE06eZ1JYYUFiBqWZT
 X2MzBoWZLyJ6kIV23B7VhJ4m+KA8E/qEWCIJuIx4ahWN+C/Tgfr1WK3j2chq6k4a0J4Ai3O1mr7
 2Ib9zsnu4493f13+esYXgbtXAploh/DBUbE8nPZ16h4Hs+AF7EpMd1/PDHmHGDHCvnUe1mFGMYk
 YT8XsfLsxIDnc8+P6SDjV0gW+XtMjdSTvtRcwh65jkShAXMpzUXbteHXFZovm0ROgs2IXTbRky1
 tWmHEYuUseRmr7sRMmGiXBKULdaCxyVhy0sZFnx/L0sixnQiXrF4X3kobbh/cfoKJt0fLPXGeyd
 odysJbyWjfAgg5XWtnA==
X-Proofpoint-ORIG-GUID: M12ZfVbck_Eszb2jcXL5aoFpWIb83GUT
X-Proofpoint-GUID: M12ZfVbck_Eszb2jcXL5aoFpWIb83GUT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_164644_609613_9D00DDC2 
X-CRM114-Status: GOOD (  16.85  )
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

On Wed, Oct 14, 2026 at 11:31:50PM +0200, Sebastian Reichel wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Use the new USB-C DP AltMode defines for the SVID and the capabilities
> VDO to make the DTs more readable. This also fixes up announcing
> 0xffffffff, which is simply wrong as that allows using the port in
> upfacing mode (i.e. the board receiving DisplayPort data, bandwidth
> above HBR3 or pin configurations not handled by USBDP.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts | 8 ++++++--
>  arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts        | 8 ++++++--
>  arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts         | 8 ++++++--
>  arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi      | 8 ++++++--
>  arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts     | 8 ++++++--
>  5 files changed, 30 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

