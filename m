Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAEBBCD6E43
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2026 11:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fyuHx5/5ZvH1qgXlQ0SO3dmToxgjn2GMPokfTYgcJgE=; b=F8GSH+OWmCtkjOSSZJIrwMyVdM
	z5yNO+wXC2GIIfc3kmb47t/APH025k1I0P8LpPOX2jAU4iVncRalC8b/XVZdFaQd1/xQj7f/9Hq+S
	NAxbrVWPn3mpKT5zqiInuwA/IPdlBxEHMNnE30LBjowbvpZlGks232rW1xypU8J9PiT76HIs8T15c
	2FjS5UvELQ6K7/9BUWJzrWwDMF+LC12LaWSX8k9mPQksSNEXU3tXtIO+GN9zHjtHlPv6OokG7AZdj
	oEtDRaL3fpA/U/0CW1fpqswDgn1PmtVWfR0z2hMxCPsaYeTC85C6dQ61a1q6HX5HagZCa+1q0gTP/
	GJngWh6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSvcv-00000007Ixe-2ppY;
	Fri, 29 May 2026 11:43:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSvcs-00000007Iwp-3xH6
	for linux-mediatek@lists.infradead.org;
	Fri, 29 May 2026 11:43:44 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T6OBsK562424
	for <linux-mediatek@lists.infradead.org>; Fri, 29 May 2026 11:43:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fyuHx5/5ZvH1qgXlQ0SO3dmToxgjn2GMPokfTYgcJgE=; b=Fu2xW87YYyD+4yeW
	KDg4YEwTK1yKM6c34f+6/pxqjBETi2zXuZLZ7Vbd7nCqyIHkTWdzz2S6U8JNvFzR
	V79yctXtNO8+RiYESsy1Am1J+AoaBWVTaYEqPoF7/EELwXQsMHuYPvopds/Gwzkm
	ffpF6F1n/2wtxTER/MqlSN6zm7uTPXijiZqKhEG0hkEhowZgcgQ3/guY+t/QBfo6
	63Yj1qtmZuv+8dXufp919UlzBbfWBj98E05nf43soX/b3MmLCT89LRbCs2X7MoR+
	2gICN3w3XG7przi1xNh2UA4rl0Su45BZ8XWmK3hVP5x4PEHy+8suox0IzvSj/Vrk
	S/Inow==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eevug3cgc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 29 May 2026 11:43:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-914b5249bc1so1182410085a.2
        for <linux-mediatek@lists.infradead.org>; Fri, 29 May 2026 04:43:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780055021; cv=none;
        d=google.com; s=arc-20240605;
        b=frXKstn4tBJ+ccfcY6pgIB6rimT21//4aFoVv67QObNA+hjB3/HO0+dYWNUpjzHcpO
         ByRPeG2IMye+q6l556i0S49zAWbPcUokQVeww9phpuS82ni1Cy7cS8vPJyvX23eyFJLf
         f3T0FiS7NoIY2mm6QGDGJgMl6pbVyCjKM+JaDcF+hz9tH6XqLshvygwvC8or+YzO7V2s
         uEF8Dy7oJ9gGmGqZyrL/6B9G5elyKs6LMSypOB7ej4vqM2065xwyL6xD5qZ8YJiLP3qD
         ItaJzRNRjuydrYL2OXQ2bN93ufeo+npXFtyZmczdryWUCdwgY7VCCah3uxMFNfGrYK+M
         W2kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fyuHx5/5ZvH1qgXlQ0SO3dmToxgjn2GMPokfTYgcJgE=;
        fh=JfynxNlmkCktbhWCo4+gtlE8QN629EyBSXaMz8wdsjk=;
        b=WLA83izSsoClb0+jjJP4qg5KNhq08c4FRBMtNqLNm1me1i2ba0P5vcvpij88233sT7
         qrs3ESjywaPMtnQbR0W9mdaeNVgDSSNDc1VHUYM5TMAvf/b8tmdq2vDs/Aixj09PM8hs
         mnFQymUMNUSFhGq4DcnW6ssYm8Qy7AETHzYJuZkhE2XVui/yqs67IcgqBmrnTKbj8p7t
         bEIrVCXayenfk+x2piJxQdn5i5VSE3eIZXyC2ypdTht1PFzpewZQSF9zOWhvQr8iu+Mb
         dWCfN+QTjinOJRj5GY6bIBJaeneuYA99S/LBbXTaPiZOy2AdyP8elbqfOb3lrRFkcwvC
         FMZg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780055021; x=1780659821; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fyuHx5/5ZvH1qgXlQ0SO3dmToxgjn2GMPokfTYgcJgE=;
        b=W/B6o2LvT9Q6ETGeMLM+H9kPha7NLtwok7uCZRFX/ssDW1ZnR+HO6EOq+QTdckJKek
         Ir74XzDwJXaIFpJUuWyxcK6O7P3yn1uIcPqPL3e0rlp9MJMgK5cinoilG5cLbATKup+R
         0c4zthIFnsHkMMHxI4nVNNFI2wkceutvf7NEDs1CgvwQ3jzVGPXL817R2l6GN//6iKwD
         JP0W8D4actRtdOdj9dGmHbJSa9hvmN5E17OdSZj94m9P7sf00FXhJjlO/tPUct8v5UPx
         1Di4PD5QO5brT++ateivpOEIJDqJsNJPPsENsOkLRWHhNqkJ4Sbe74zpC02KeSjrDh3u
         uBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780055021; x=1780659821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fyuHx5/5ZvH1qgXlQ0SO3dmToxgjn2GMPokfTYgcJgE=;
        b=RxdfafQoNqIsXDoooHo03NOKeXAJz6EL4fF+4o/NwnHo0ICs7C8EWV+Ra5nixsZIui
         UmgHVOJzmy4wkSdV5MeLyJTHbCwhF9tk1Odnj+F49M1E10w6S2DTs6I6Fkl0VksVqpon
         0Tm+3ZlYZMCF5mth9GMbNes91q5B5uh3oG0WWP6abll/Wy8YWyOS30bvzIWiD977X7L5
         NSrTfjDTB+MPEZqOuOmPnUPSKjtY8jUKMS9KEkbR1m4WUq737KQLO9Zz5hPU0r9FJbyk
         /3aX6AIgw3XTDQ3ZeiAxVBenMx2YRKPmy1Gg05uvDvajThC1l5XFUuJ8OHra1ykjjow8
         Id+Q==
X-Forwarded-Encrypted: i=1; AFNElJ/wFAXoejpr4WL6wutM1O/T7w3xkR+08K+NGdYaRl3R9E8GDl4x1JbRcC6Q3hFqvW0uA6m51eQ710Fiz7uOEw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyreilQf0dmOB7qUHwTzLiU8A1WSX5DQeZd8BRVp5wIEDIe5is1
	WaPc1u4aIc5piST0JZaJhIxAq+Vlx4ILqdPQCCdsT/+F6xNuUHM6QdfO5ap7fUecCwtr+ru2GjM
	OOBlsLBwoswfT+PToPxOApHgrRDc3ERSMDj3j2+eTszdM0q78w4u3FpQOxBbmPiLa6qFSqr2ZY8
	xxaU6o3VvGrb/dUQxljfr9rckRLuCWROLAMbudHzlCFZdoAZyD0A==
X-Gm-Gg: Acq92OF27Vz7hAcIn4DvaRlL8xhKaRFmHf5hl6Slf6rMvQmolIZ0cfh7gT91OzxQ+y0
	EHeUfdl/4iRBZP6gL7oJW7MgDNInCVu34EYBMWu1rlaMmuTZSriPy/3YUk6DwwAdYsgWsEARw9L
	J9EradvOUo52oichYzDbuHf8qL6NzUYpID92GhiZvXNQsuM3xzzFSToAfh/nrLOxc83Evvju1LG
	b17CLSBdv0u9HATTo1PDcIJgv7ltyPrt6Z9Ud2xzS03A7CyeU0=
X-Received: by 2002:a05:620a:46ab:b0:8cb:9975:cba8 with SMTP id af79cd13be357-915300d1513mr314026185a.62.1780055021105;
        Fri, 29 May 2026 04:43:41 -0700 (PDT)
X-Received: by 2002:a05:620a:46ab:b0:8cb:9975:cba8 with SMTP id
 af79cd13be357-915300d1513mr314021885a.62.1780055020581; Fri, 29 May 2026
 04:43:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260529-t9xx_driver_v1-v1-0-bdbfe2c01e57@compal.com>
In-Reply-To: <20260529-t9xx_driver_v1-v1-0-bdbfe2c01e57@compal.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 29 May 2026 13:43:29 +0200
X-Gm-Features: AVHnY4IbpeWPy4_nKNjQp3G-zFolj0rVyObyJjw9IsO8YU5DydMGzXKXSO_M7DM
Message-ID: <CAFEp6-0ntknHnpsj99YUHpD8R5SMDHf8Upn+yaED-A-sxonscw@mail.gmail.com>
Subject: Re: [PATCH 00/11] net: wwan: t9xx: Add MediaTek T9XX WWAN driver
To: jackbb_wu@compal.com
Cc: Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Wen-Zhi Huang <wen-zhi.huang@mediatek.com>,
        Shi-Wei Yeh <shi-wei.yeh@mediatek.com>,
        Minano Tseng <Minano.tseng@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDExNiBTYWx0ZWRfX/ACwm4wY47ba
 Z3YpzHOrPwL7QmFQXaYSNZxPTHMu5X8qPtmGXDIbI++X1EjupbygoExeMXJBbwYrEwTc+4oBWFI
 QjsQYxSKiHYPkhHsOln2WN/wjdAfALASZCOOKsBKqnsVIwj2OH8ES1RBTBfhVcQAXkkCN/5euwq
 RUN8QCc2VLx37OT+nf1pYs2pLsRCbr2PsuHciwOYeepXtWoEAdcWice9Cu4fSb6f1g1/vPi9s7O
 YMCCJFivSalb9gXILP6oXb+vpR/3hdR6PYzCsKBC3+UrjJcZLDmOP2TTqe/R9N3C3GGzeyWNjXN
 5vGO7vZh9+ved+tsMWQtZAkdQEqQhYXUUJlzrf2I4qEemVObfKLEjuJ2aZYjYMq6cxtjcntEcKv
 xMlf3Nu5n0eVbBRE8B+mHa+7YWv8HVg9YAuL11W+CcfxA7Yc21zU0aCTuJogizVGF+rafSEpNWA
 b8dt0P7UC605VkjBoXA==
X-Authority-Analysis: v=2.4 cv=SNBykuvH c=1 sm=1 tr=0 ts=6a197bee cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=3D83DlupAAAA:8
 a=GQ8KfrVOiNvgsdg8hPQA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=LLo2LcjZcqwTTUQ_I4Ao:22
X-Proofpoint-ORIG-GUID: r8siYSePkXlF9kObYtCwZMO1QrALqNzw
X-Proofpoint-GUID: r8siYSePkXlF9kObYtCwZMO1QrALqNzw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1011 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_044342_985748_25282AA9 
X-CRM114-Status: GOOD (  26.59  )
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

Hi Jack,

On Fri, May 29, 2026 at 12:31=E2=80=AFPM Jack Wu via B4 Relay
<devnull+jackbb_wu.compal.com@kernel.org> wrote:
>
> T9XX is the PCIe host device driver for MediaTek's
> t900 modem. The driver uses the WWAN framework
> infrastructure to create the following control ports
> and network interfaces for data transactions.
> * /dev/wwan0at0 - Interface that supports AT commands.
> * /dev/wwan0mbim0 - Interface conforming to the MBIM
>   protocol.
> * wwan0-X - Primary network interface for IP traffic.
>
> The main blocks in the T9XX driver are:
> * HW layer - Abstracts the hardware bus operations for
>    the device, and provides generic interfaces for the
>    transaction layer to get the device's information and
>    control the device's behavior. It includes:
>
>    * PCIe - Implements probe, removal and interrupt
>      handling.
>    * MHCCIF (Modem Host Cross-Core Interface) - Provides
>      interrupt channels for bidirectional event
>      notification such as handshake and port enumeration.
>
> * Transaction layer - Implements data transactions for
>    the control plane and the data plane. It includes:
>
>    * DPMAIF (Data Plane Modem AP Interface) - Controls
>      the hardware that provides uplink and downlink
>      queues for the data path. The data exchange takes
>      place using circular buffers to share data buffer
>      addresses and metadata to describe the packets.
>    * CLDMA (Cross Layer DMA) - Manages the hardware
>      used by the port layer to send control messages to
>      the device using MediaTek's CCCI (Cross-Core
>      Communication Interface) protocol.
>    * TX Services - Dispatch packets from the port layer
>      to the device.
>    * RX Services - Dispatch packets to the port layer
>      when receiving packets from the device.
>
> * Port layer - Provides control plane and data plane
>    interfaces to userspace. It includes:
>
>    * Control Plane - Provides device node interfaces
>      for controlling data transactions.
>    * Data Plane - Provides network link interfaces
>      wwanX (0, 1, 2...) for IP data transactions.
>
> * Core logic - Contains the core logic to keep the
>    device working. It includes:
>
>    * FSM (Finite State Machine) - Monitors the state
>      of the device, and notifies each module when the
>      state changes.
>
> The compilation of the T9XX driver is enabled by the
> CONFIG_MTK_T9XX and CONFIG_MTK_T9XX_PCI config option
> which depends on CONFIG_WWAN.

Can you specify which userspace counterpart you need (e.g., a
ModemManager version or a link to the relevant patch series)?


>
> ---
> Jack Wu (11):
>       net: wwan: t9xx: Add PCIe core
>       net: wwan: t9xx: Add control plane transaction layer
>       net: wwan: t9xx: Add control DMA interface
>       net: wwan: t9xx: Add control port
>       net: wwan: t9xx: Add FSM thread
>       net: wwan: t9xx: Add AT & MBIM WWAN ports
>       net: wwan: t9xx: Introduce data plane hardware
>       net: wwan: t9xx: Add data plane transaction layer
>       net: wwan: t9xx: Introduce WWAN interface
>       net: wwan: t9xx: Add power management support
>       net: wwan: t9xx: Add maintainers and documentation
>
>  .../networking/device_drivers/wwan/t9xx.rst        |   48 +
>  MAINTAINERS                                        |   10 +
>  drivers/net/wwan/Kconfig                           |   17 +
>  drivers/net/wwan/Makefile                          |    1 +
>  drivers/net/wwan/t9xx/Makefile                     |   16 +
>  drivers/net/wwan/t9xx/mtk_ctrl_plane.c             |   95 +
>  drivers/net/wwan/t9xx/mtk_ctrl_plane.h             |   88 +
>  drivers/net/wwan/t9xx/mtk_data_plane.c             |  104 +
>  drivers/net/wwan/t9xx/mtk_data_plane.h             |  105 +
>  drivers/net/wwan/t9xx/mtk_dev.c                    |   55 +
>  drivers/net/wwan/t9xx/mtk_dev.h                    |  114 +
>  drivers/net/wwan/t9xx/mtk_fsm.c                    |  931 +++++++
>  drivers/net/wwan/t9xx/mtk_fsm.h                    |  140 +
>  drivers/net/wwan/t9xx/mtk_port.c                   |  967 +++++++
>  drivers/net/wwan/t9xx/mtk_port.h                   |  176 ++
>  drivers/net/wwan/t9xx/mtk_port_io.c                |  576 +++++
>  drivers/net/wwan/t9xx/mtk_port_io.h                |   41 +
>  drivers/net/wwan/t9xx/mtk_utility.h                |   33 +
>  drivers/net/wwan/t9xx/mtk_wwan.c                   |  475 ++++
>  drivers/net/wwan/t9xx/mtk_wwan.h                   |   17 +
>  drivers/net/wwan/t9xx/pcie/Makefile                |   19 +
>  drivers/net/wwan/t9xx/pcie/mtk_cldma.c             | 1527 +++++++++++
>  drivers/net/wwan/t9xx/pcie/mtk_cldma.h             |  176 ++
>  drivers/net/wwan/t9xx/pcie/mtk_cldma_drv.c         |  373 +++
>  drivers/net/wwan/t9xx/pcie/mtk_cldma_drv.h         |  174 ++
>  drivers/net/wwan/t9xx/pcie/mtk_cldma_drv_m9xx.c    |  177 ++
>  drivers/net/wwan/t9xx/pcie/mtk_cldma_drv_m9xx.h    |  101 +
>  drivers/net/wwan/t9xx/pcie/mtk_ctrl_cfg_m9xx.c     |   55 +
>  drivers/net/wwan/t9xx/pcie/mtk_dpmaif.c            | 2714 ++++++++++++++=
++++++
>  drivers/net/wwan/t9xx/pcie/mtk_dpmaif.h            |   16 +
>  drivers/net/wwan/t9xx/pcie/mtk_dpmaif_drv.c        | 1586 ++++++++++++
>  drivers/net/wwan/t9xx/pcie/mtk_dpmaif_drv.h        |  268 ++
>  drivers/net/wwan/t9xx/pcie/mtk_dpmaif_drv_m9xx.c   |  687 +++++
>  drivers/net/wwan/t9xx/pcie/mtk_dpmaif_reg.h        |  387 +++
>  drivers/net/wwan/t9xx/pcie/mtk_dpmaif_reg_m9xx.h   |   37 +
>  drivers/net/wwan/t9xx/pcie/mtk_dpmaif_ring.c       |  168 ++
>  drivers/net/wwan/t9xx/pcie/mtk_dpmaif_ring.h       |  161 ++
>  drivers/net/wwan/t9xx/pcie/mtk_pci.c               | 1067 ++++++++
>  drivers/net/wwan/t9xx/pcie/mtk_pci.h               |  219 ++
>  drivers/net/wwan/t9xx/pcie/mtk_pci_drv_m9xx.c      |   70 +
>  drivers/net/wwan/t9xx/pcie/mtk_pci_reg.h           |   72 +
>  drivers/net/wwan/t9xx/pcie/mtk_trans_ctrl.c        |  593 +++++
>  drivers/net/wwan/t9xx/pcie/mtk_trans_ctrl.h        |  105 +
>  43 files changed, 14761 insertions(+)
> ---
> base-commit: eb3f4b7426cfd2b79d65b7d37155480b32259a11
> change-id: 20260529-t9xx_driver_v1-1744f8af7739
>
> Best regards,
> --
> Jack Wu <jackbb_wu@compal.com>
>
>

