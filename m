Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86634606A334
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 15:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iFXTaXjC;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q2TZxOSb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SXp+Z2j/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jXbUJiPSh6MLJ64Sce3vEUUJr56fAbgSiuchdokkKtk=; b=iFXTaXjCUY9UcZ
	7DA8gHUEl2+xSGLAu1UH08MsBvntGUYZMETEC5DB8l8boHi5tQLpSTWFuQV8GLnRYU5FlrlC9AaTu
	wT6286ihdJYK3jgrNWVw56AxVfphY9TCh19WvJ8X+qgHwVhcRE5wIDTTuR+BvvouT6HviuSJvSspF
	4Yzpnwfm2+gDM30RMJcpupAuvpvDVK0cXkhKi8Dy9L0/v1MytVQfZqFCQGPJep/RNM0MxIDV+roix
	f+SfH4fmuAvIS5NWNZqcbOqMMVLP+cLptU9ASqaepNszcnowiSRF3sNblY7eCkoWcNRJSF4bpSQKD
	ySYd2RCiqU0y1V9Myh+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTL7c-00000006IiE-00jD;
	Tue, 17 Nov 2026 15:29:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTL7Y-00000006IgX-12qJ
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Nov 2026 15:29:22 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHFSaHN2555437
	for <linux-mediatek@lists.infradead.org>; Tue, 17 Nov 2026 15:29:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jXbUJiPSh6MLJ64Sce3vEUUJr56fAbgSiuchdokkKtk=; b=Q2TZxOSb0PHDkh2G
	uzVw8v3O06rJEl/ccvlABBmqNY4IWjJ598uWH3JNKQiZN5nOxGRFt39Pdx02tkiR
	8QESUdFk/oVVOSlwupvMYB3ZSDnrn/KoXiaj7s8IdCzUpGk+CEh4LVi7qJ65k/Dn
	mohkmuNNfcV3iIv0WwHlb75PKd/MOVILlhyetHQJPwZiZnixNxEH/ZznhkgVW9Mw
	aOac40HXLNVo45KlUjlBaORGZulcRK9fj3+9/wDD4blZRribS/K/2HT7/x81e15N
	zJ7WaXjDIVGjR9e6GRZu/TX5Th9UpKCxZstBz+wcQohXOD/O3JpuVinhxxo7rwXn
	WalBXw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0c7h3etu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 17 Nov 2026 15:29:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9495c71055bso659747985a.2
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Nov 2026 07:28:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794929327; cv=none;
        d=google.com; s=arc-20260327;
        b=P1ThMwN4sEhPzFZr3q8vfCmNSJOSXB+/Ojmo4Erre1CkbV0eiboDo/vPnCH6pvVX0D
         i4oNjoV6CAFP/PEZsMgE9fq/fSMTahvPi3L/jjBQpvhJDXZuX5DhgVAUmeS8JzSsqTdw
         PwNNX26ZYFgEVutJaQJyBWd3YsepwKTTSAEAYKkr4nmG6qTAtwv37ZsPUzyeut2eDH7m
         ywYJ65h1nEIkia2dHpmnJZEl0oWTuXZPswFNzy3uR0jEFniUNIQnbDj5Ga+5bTPs9EkB
         UL9hwGL/M50CZ6M3lHGYqoNvqYfcFUMXw9AEcPsflOQMO0J6SFZ6QuI0bQ321VK35jMa
         xV/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jXbUJiPSh6MLJ64Sce3vEUUJr56fAbgSiuchdokkKtk=;
        fh=juHW4tIKRvS0GV74FLCFaN/WSPGRBgOjg5W3jUQ3LQE=;
        b=c6EJJUWhLCJAoGHXXv9sqqOnjfXirMQrBMTBsczAFl/Kf8ByaEKl5oFT1EI0TJq+ei
         ghxWuMO1EARTUpDMnEqJM6SwIhO1+Lr8yVIpK+O1LBf5hQbuKjmkQpBZbc+uRq3NVeHB
         f3bVInTppS2Q4eSE6ozPlVjOB+BT8ivxAhA/zC/JUJMrsKoT6EtAjpdJaPlyBpIjLC8S
         BM3O7lrxJOaw2XPQb8awhHIyng+2YwpvquJQ1QOYvaM4FpFHJUdIGyyfKyQ7ilYID1GF
         nvQSsiOs+SC9Voj1KMi2+B8yfNNByyex/YbOa8YrhnIT11fnlUpnUYBftLKouHsAT7S0
         NjJg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794929327; x=1795534127; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jXbUJiPSh6MLJ64Sce3vEUUJr56fAbgSiuchdokkKtk=;
        b=SXp+Z2j/8Q4yTDM40M2ayRcM6uBLtalHfDCEurgJsbBNvn+xKXPKDfd37ag8a8Wldo
         JDBRTRvZ4YV1xiesb5pB3C+/Eyl575h8feLB1dB8ttQDOI50dFTHe6zP6h56KvR1bowm
         VlWwTmCdHQzRJ7/Da9WM+5r2XnKBZw09JVQa5XRPhnwJI5wHlwW6nsZ/DhfbfT6cLJae
         Hwe8lQYGG1inJDb9HjTVAf1N1YjzYJH69q/l6HxBvqqVfVgeuKl12XyfoVfGuAgbpvyT
         qC23IhGeOhihKvfhaGjh/W6BQFcAZZt67KMXxMAy2r+0k5WuOdq2XC4YXL+6c41XBZLE
         BBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794929327; x=1795534127;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jXbUJiPSh6MLJ64Sce3vEUUJr56fAbgSiuchdokkKtk=;
        b=R8RZ+pbL2Ue4LWWEpQc/b4GhHhGcOv6MqB4pptsVWiJm6sIAmP3P5UwYO7d3b5AOrr
         zMlGiM8Q+yOweatdnC9K+6B9CzBetwTY8UGuLKQ/zAmXruaZp311kpD1y8wyhaWqSUvP
         8uR8JRWiX7lFBOEHujPnvkr18zNqAu+LFuhSdlIr4ZFXbyAY7n94LM2GFhM5Kwy11YTs
         DZsHhFxLXvX6rx4jdvBiRyt51/5W68yj0ueJxiIFeZBRXH9LZ59eKvd+fdRDqaDyjGz4
         PBNGT1pGDd/zLUyQHH0RgWWLBnBrVR8u5QnJs4Co4N/f1CAy0teL1voFj6QU/+w9Ihhp
         SyNA==
X-Forwarded-Encrypted: i=1; AL+hErGXrZJFMIuUewwFOu2q69xFHelR4C4H+HsG80+s7jRAgTAwfhczeJU3lIG6Yphg9jE7Ua//0OyuAhtwezhjRg==@lists.infradead.org
X-Gm-Message-State: APuU4Z9nrmUCsR3CKBajL+M1+MmvGsEwGsMtRQyt8buJ6/h7Z5jWF5i+
	PJCorLc9O3uVQeejpAabKyIGpNCfrcxYxstFeEkuCPP3Hkdvrpp3az0XbBvYoR/tV6i62ckDSLB
	A07XyNa3MUmvkRuU+AQJa8vK8daz3EVELyHvzvBUXrraafJG2nmC/sYvTyeKPMSS1oIiGKnLXqy
	Xw8tf3eSfaEv+ij9GZ4q3uCY8/2ggKmaFKm/T6ijiCIDsOmBCq0w==
X-Gm-Gg: AYBFou0IlXmnEHAfZqhha55RuNyDKkCaM1p9OXSoc1tqVjN2IK5KuF6wii7aARRcFhE
	8oBZPBkwLRCBaad0WNMX94Bv25IXGCdJ5e8MVUV8REMS4Qv5GUHzEaqkPVm0NJvlI0XTMwT0ULv
	XGmL3Yl4EdBickFMJvsE7h1dJSxjhf9Gft68trxKQGCzV9gpPnl8oacs7TRriF6XYjFh/F4HcV7
	0fPFW2/H3m5ft3VYJmUKO86Oy8MgXFz+etGrVaaXLcfY4ZEkuoI/L6IfsPGRPZG/uY3Hc/PDv0Q
X-Received: by 2002:a05:620a:45a7:b0:949:74d8:4715 with SMTP id af79cd13be357-94974d84d3dmr1268424585a.52.1794929326628;
        Tue, 17 Nov 2026 07:28:46 -0800 (PST)
X-Received: by 2002:a05:620a:45a7:b0:949:74d8:4715 with SMTP id
 af79cd13be357-94974d84d3dmr1268419385a.52.1794929325829; Tue, 17 Nov 2026
 07:28:45 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261117-t9xx_driver_v1-v12-0-e181b616b820@compal.com> <20261117-t9xx_driver_v1-v12-1-e181b616b820@compal.com>
In-Reply-To: <20261117-t9xx_driver_v1-v12-1-e181b616b820@compal.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 16:28:33 +0100
X-Gm-Features: AclHuK9vuI3dlMLqxA2jWgkJMoNHuqA1g1wOWeksyQSJzt2NPtwjEnEGsNVUNug
Message-ID: <CAFEp6-1r=SYCSvUNj_Up346vFssTFckWX8qg_Y_AWAfNX-jUpw@mail.gmail.com>
Subject: Re: [PATCH net-next v12 1/6] net: wwan: t9xx: Add PCIe core
To: jackbb_wu@compal.com
Cc: Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Wen-Zhi Huang <wen-zhi.huang@mediatek.com>,
        Shi-Wei Yeh <shi-wei.yeh@mediatek.com>,
        Minano Tseng <Minano.tseng@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Robert Yu <robert_yu@compal.com>, Jeff Chang <Jeff_Chang@compal.com>,
        Eric Dumazet <edumazet@kernel.org>, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: l1y-xFC1IH3xrvIbVd0CMoaXd4mIjHOX
X-Proofpoint-ORIG-GUID: l1y-xFC1IH3xrvIbVd0CMoaXd4mIjHOX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2MSBTYWx0ZWRfX3EEreWWXfDVN
 0QsCCnv+8prY3mvlxRtwVokLbY5ByiC6jJKiZuj+9rokJnKVqKpz06MPzf0XPauAy49y3NZPkPT
 navD3SujW0yf50lY0zV0PrSUFpd8zURBLMgOiN8agh/8wdhB6p0cZbAyS/Ky21ZnR7fFgdyQZLx
 OMP/yyqsWaHk+j5tMj7a124Xhi+naadGmKL8qEzwCQupPWaJiVEMM7+k7NgT7N9BjFgxhdejEUT
 rtPB6sW+pnEUpsmev+LeGC7SqPuZfe6zlb/yt2or6mMvexbwJY719uqfbjB0F7K4d+Lx5JamULL
 zlzY1fnSr2Wv3Jrv5IL5as1v9C5uphsi54ufcoCUQiU1FLZ5nCdFF436rFFksVSk7F2+KFg46X8
 O9eD2F1UPBc40FMWnsHrx1VFg9hlkDyTa5jCcC9NoV27I26jyJUMzygnO0zJn6ZYEyO83oTZHcL
 IdqUZZB9LAkmofKs5zA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2MSBTYWx0ZWRfXyGeE6r2puS/p
 yAVHoeW4iTRdl+EA2XfaVqJ7cKi2WNwzpt6VrP5Jg5miFgPvdLPhtoD07rYyTebvMZ9erZoA/Ol
 S76Lo4gLQMkbvcphxpizghW0kDdoua8=
X-Authority-Analysis: v=2.4 cv=bobZl0ai c=1 sm=1 tr=0 ts=6afc72cb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=3D83DlupAAAA:8 a=mpaa-ttXAAAA:8
 a=w9rbOEL0yjmFtcy6l6MA:9 a=rOGyCeFTbihjvwDg:21 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=LLo2LcjZcqwTTUQ_I4Ao:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_072920_589490_3498DCEF 
X-CRM114-Status: GOOD (  38.49  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 11:51=E2=80=AFAM Jack Wu via B4 Relay
<devnull+jackbb_wu.compal.com@kernel.org> wrote:
>
> From: Jack Wu <jackbb_wu@compal.com>
>
> Registers the T900 device driver with the kernel. Set up all
> the fundamental configurations for the device: PCIe layer,
> Modem Host Cross Core Interface (MHCCIF), modem common control
> operations, build infrastructure and MAINTAINERS entry.
> Besides the T900 itself (14c3:0900) the driver binds its
> HP-branded variant, the HP RMM-G4 (03f0:01ca); both IDs are
> exported via MODULE_DEVICE_TABLE for module autoloading.
>
> * PCIe layer code implements driver probe and removal, MSI-X
>   interrupt initialization and de-initialization, and the way
>   of resetting the device.
> * MHCCIF provides the interrupt channels used for the boot
>   handshake and for the host-to-device reset doorbell.
> * Modem common control operations provide the basic read/write
>   functions of the device's hardware registers,
>   mask/unmask/get/clear functions of the device's interrupt
>   registers and inquiry functions of the device's status.
> * Add MAINTAINERS entry for the MediaTek T9XX 5G WWAN modem
>   device driver.
>
> Removal resets the modem, because the next driver load has to
> redo the device handshake and status sync and cannot do that
> against firmware left running by the previous load.  Shutdown
> runs the same teardown and reset when kexec_is_in_progress() says
> this is a kexec reboot: that gets no platform reset, and the next
> kernel would otherwise find that firmware still running.  Any other
> reboot or power-off ends in a platform reset or power loss, so
> shutdown leaves the modem alone there and adds no delay.
> A crash kexec (kdump) skips .shutdown and is not covered: the modem
> stays unusable in the capture kernel until the next platform reset.
> Probe does not reset the modem or look for running firmware: it has
> no stronger reset than removal, and the firmware state is only known
> after the handshake added later in the series.
> There are no power management callbacks, so system suspend is not
> supported: suspend and resume have to be negotiated with the modem
> over MHCCIF, which this series does not implement.
> mtk_pci_remove() evaluates MRST._RST on the device's own ACPI
> node: that is a platform-level reset and does not depend on the
> firmware's state.  Where the platform has no MRST._RST, or the
> method fails, removal falls back to the MHCCIF
> DEV_EVT_H2D_DEVICE_RESET doorbell if the link is still up.  The
> doorbell is a request to the firmware, so it is best effort and
> cannot recover firmware that has stopped responding - the case
> the reset exists for.  Probe therefore does not require
> MRST._RST; without it the driver still binds and only removal is
> degraded.
>
> Signed-off-by: Jack Wu <jackbb_wu@compal.com>
> ---
>  MAINTAINERS                              |   11 +
>  drivers/net/wwan/Kconfig                 |   11 +
>  drivers/net/wwan/Makefile                |    1 +
>  drivers/net/wwan/t9xx/Makefile           |    9 +
>  drivers/net/wwan/t9xx/mtk_dev.h          |   39 ++
>  drivers/net/wwan/t9xx/pcie/mtk_pci.c     | 1034 ++++++++++++++++++++++++=
++++++
>  drivers/net/wwan/t9xx/pcie/mtk_pci.h     |  139 ++++
>  drivers/net/wwan/t9xx/pcie/mtk_pci_reg.h |   34 +
>  8 files changed, 1278 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 893b0670a7b6..6f14af98fa5f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17250,6 +17250,17 @@ L:     netdev@vger.kernel.org
>  S:     Supported
>  F:     drivers/net/wwan/t7xx/
>
> +MEDIATEK T9XX 5G WWAN MODEM DRIVER
> +M:     Jack Wu <jackbb_wu@compal.com>
> +M:     Robert Yu <robert_yu@compal.com>
> +M:     Jeff Chang <Jeff_Chang@compal.com>
> +R:     Wen-Zhi Huang <wen-zhi.huang@mediatek.com>
> +R:     Shi-Wei Yeh <shi-wei.yeh@mediatek.com>
> +R:     Minano Tseng <Minano.tseng@mediatek.com>
> +L:     netdev@vger.kernel.org
> +S:     Supported
> +F:     drivers/net/wwan/t9xx/
> +
>  MEDIATEK USB3 DRD IP DRIVER
>  M:     Chunfeng Yun <chunfeng.yun@mediatek.com>
>  L:     linux-usb@vger.kernel.org
> diff --git a/drivers/net/wwan/Kconfig b/drivers/net/wwan/Kconfig
> index 958dbc7347fa..8290ba8e7252 100644
> --- a/drivers/net/wwan/Kconfig
> +++ b/drivers/net/wwan/Kconfig
> @@ -121,6 +121,17 @@ config MTK_T7XX
>
>           If unsure, say N.
>
> +config MTK_T9XX
> +       tristate "MediaTek PCIe 5G WWAN modem T9xx device"
> +       depends on PCI_MSI
> +       help
> +         Enables MediaTek PCIe based 5G WWAN modem (T9xx series) device.
> +
> +         To compile this driver as a module, choose M here: the module w=
ill be
> +         called mtk_t9xx.
> +
> +         If unsure, say N.
> +
>  endif # WWAN
>
>  endmenu
> diff --git a/drivers/net/wwan/Makefile b/drivers/net/wwan/Makefile
> index 3960c0ae2445..7361eef4c472 100644
> --- a/drivers/net/wwan/Makefile
> +++ b/drivers/net/wwan/Makefile
> @@ -14,3 +14,4 @@ obj-$(CONFIG_QCOM_BAM_DMUX) +=3D qcom_bam_dmux.o
>  obj-$(CONFIG_RPMSG_WWAN_CTRL) +=3D rpmsg_wwan_ctrl.o
>  obj-$(CONFIG_IOSM) +=3D iosm/
>  obj-$(CONFIG_MTK_T7XX) +=3D t7xx/
> +obj-$(CONFIG_MTK_T9XX) +=3D t9xx/
> diff --git a/drivers/net/wwan/t9xx/Makefile b/drivers/net/wwan/t9xx/Makef=
ile
> new file mode 100644
> index 000000000000..bd6063c85c2b
> --- /dev/null
> +++ b/drivers/net/wwan/t9xx/Makefile
> @@ -0,0 +1,9 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +ccflags-y +=3D -I$(src)/pcie
> +ccflags-y +=3D -I$(src)
> +
> +obj-$(CONFIG_MTK_T9XX) +=3D mtk_t9xx.o
> +
> +mtk_t9xx-y :=3D \
> +       pcie/mtk_pci.o
> diff --git a/drivers/net/wwan/t9xx/mtk_dev.h b/drivers/net/wwan/t9xx/mtk_=
dev.h
> new file mode 100644
> index 000000000000..fc25418bb957
> --- /dev/null
> +++ b/drivers/net/wwan/t9xx/mtk_dev.h
> @@ -0,0 +1,39 @@
> +/* SPDX-License-Identifier: GPL-2.0-only
> + *
> + * Copyright (c) 2022, MediaTek Inc.
> + */
> +
> +#ifndef __MTK_DEV_H__
> +#define __MTK_DEV_H__
> +
> +#include <linux/bits.h>
> +#include <linux/types.h>
> +
> +struct device;
> +
> +#define MTK_DEV_STR_LEN 16
> +
> +enum mtk_user_id {
> +       MTK_USER_CTRL,
> +       MTK_USER_MAX
> +};
> +
> +enum mtk_dev_evt_h2d {
> +       DEV_EVT_H2D_DEVICE_RESET        =3D BIT(2),
> +};
> +
> +enum mtk_dev_evt_d2h {
> +       DEV_EVT_D2H_BOOT_FLOW_SYNC      =3D BIT(4),
> +       DEV_EVT_D2H_ASYNC_HS_NOTIFY_SAP =3D BIT(5),
> +       DEV_EVT_D2H_ASYNC_HS_NOTIFY_MD  =3D BIT(6),
> +};
> +
> +/* mtk_md_dev defines the structure of MTK modem device */
> +struct mtk_md_dev {
> +       struct device *dev;
> +       void *hw_priv;
> +       u32 hw_ver;
> +       char dev_str[MTK_DEV_STR_LEN];
> +};
> +
> +#endif /* __MTK_DEV_H__ */
> diff --git a/drivers/net/wwan/t9xx/pcie/mtk_pci.c b/drivers/net/wwan/t9xx=
/pcie/mtk_pci.c
> new file mode 100644
> index 000000000000..cf59038f0906
> --- /dev/null
> +++ b/drivers/net/wwan/t9xx/pcie/mtk_pci.c
> @@ -0,0 +1,1034 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022, MediaTek Inc.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/bitfield.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/kernel.h>
> +#include <linux/kexec.h>
> +#include <linux/module.h>
> +
> +#include "mtk_dev.h"
> +#include "mtk_pci.h"
> +#include "mtk_pci_reg.h"
> +
> +#define MTK_MHCCIF_RC_BASE_ADDR                0x1000A000
> +
> +#define MTK_MHCCIF_RESET_DELAY_MS      2000
> +#define MTK_PLDR_READY_POLL_MS         20
> +#define MTK_PLDR_READY_POLLS           50
> +/* BAR0/1: end of the highest MAC register; BAR2/3: the ATR window */
> +#define MTK_BAR_0_1_MIN_LEN            (REG_IMASK_HOST_MSIX_GRP0_0 + 4)
> +#define MTK_BAR_2_3_MIN_LEN            ATR_PCIE_REG_SIZE
> +
> +static const int mtk_pci_irq_tbl[MTK_IRQ_SRC_MAX] =3D {
> +       [MTK_IRQ_SRC_MHCCIF] =3D 28,
> +       [MTK_IRQ_SRC_CLDMA0] =3D 27,
> +       [MTK_IRQ_SRC_CLDMA1] =3D 26,
> +};
> +
> +#define MTK_PCI_TRANSPARENT_ATR_SIZE   (0x3F)
> +#define MTK_PCI_MINIMUM_ATR_SIZE       (0x1000)
> +#define ATR_SIZE_LO32_MASK             GENMASK_ULL(31, 0)
> +#define ATR_SIZE_HI32_MASK             GENMASK_ULL(63, 32)
> +#define ATR_SIZE_BIAS_FROM_LO32                2
> +#define ATR_ADDR_ALIGN_MASK            0xFFFFF000
> +#define ATR_EN                         BIT(0)
> +#define ATR_PARAM_OFFSET               16
> +
> +struct mtk_mhccif_cb {
> +       struct list_head entry;
> +       void (*evt_cb)(u32 status, void *data);
> +       void *data;
> +       u32 chs;
> +};
> +
> +/**
> + * mtk_pci_setup_atr() - Configure a PCIe address translation rule
> + * @mdev: MTK MD device
> + * @cfg: ATR configuration parameters
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +static int mtk_pci_setup_atr(struct mtk_md_dev *mdev, struct mtk_atr_cfg=
 *cfg)
> +{
> +       struct mtk_pci_priv *priv =3D mdev->hw_priv;
> +       u32 addr, val, size_h, size_l;
> +       int atr_size, pos, offset;
> +
> +       if (cfg->transparent) {
> +               /* No address conversion is performed */
> +               atr_size =3D MTK_PCI_TRANSPARENT_ATR_SIZE;
> +       } else {
> +               if (cfg->size < MTK_PCI_MINIMUM_ATR_SIZE)
> +                       cfg->size =3D MTK_PCI_MINIMUM_ATR_SIZE;
> +
> +               if (cfg->src_addr & (cfg->size - 1)) {
> +                       dev_err(mdev->dev, "Invalid atr src addr is not a=
ligned to size\n");
> +                       return -EINVAL;
> +               }
> +
> +               if (cfg->trsl_addr & (cfg->size - 1)) {
> +                       dev_err(mdev->dev,
> +                               "Invalid atr trsl addr is not aligned to =
size, %llx, %llx\n",
> +                               cfg->trsl_addr, cfg->size - 1);
> +                       return -EINVAL;
> +               }
> +
> +               size_l =3D FIELD_GET(ATR_SIZE_LO32_MASK, cfg->size);
> +               size_h =3D FIELD_GET(ATR_SIZE_HI32_MASK, cfg->size);
> +               pos =3D ffs(size_l);
> +               if (pos) {
> +                       atr_size =3D pos - ATR_SIZE_BIAS_FROM_LO32;
> +               } else {
> +                       pos =3D ffs(size_h);
> +                       atr_size =3D pos + 32 - ATR_SIZE_BIAS_FROM_LO32;
> +               }
> +       }
> +
> +       /* Calculate table offset */
> +       offset =3D ATR_PORT_OFFSET * cfg->port + ATR_TABLE_OFFSET * cfg->=
table;
> +
> +       addr =3D REG_ATR_PCIE_WIN0_T0_SRC_ADDR_MSB + offset;
> +       val =3D (u32)(cfg->src_addr >> 32);
> +       mtk_pci_mac_write32(priv, addr, val);
> +
> +       addr =3D REG_ATR_PCIE_WIN0_T0_TRSL_ADDR_MSB + offset;
> +       val =3D (u32)(cfg->trsl_addr >> 32);
> +       mtk_pci_mac_write32(priv, addr, val);
> +
> +       addr =3D REG_ATR_PCIE_WIN0_T0_TRSL_ADDR_LSB + offset;
> +       val =3D (u32)(cfg->trsl_addr & ATR_ADDR_ALIGN_MASK);
> +       mtk_pci_mac_write32(priv, addr, val);
> +
> +       /* TRSL_PARAM */
> +       addr =3D REG_ATR_PCIE_WIN0_T0_TRSL_PARAM + offset;
> +       val =3D (cfg->trsl_param << ATR_PARAM_OFFSET) | cfg->trsl_id;
> +       mtk_pci_mac_write32(priv, addr, val);
> +
> +       /* Enable ATR last, after translation target is fully programmed =
*/
> +       addr =3D REG_ATR_PCIE_WIN0_T0_SRC_ADDR_LSB + offset;
> +       val =3D (u32)(cfg->src_addr & ATR_ADDR_ALIGN_MASK) | (atr_size <<=
 1) | ATR_EN;
> +       mtk_pci_mac_write32(priv, addr, val);
> +
> +       /* Ensure ATR is set */
> +       mtk_pci_mac_read32(priv, addr);
> +
> +       return 0;
> +}
> +
> +/**
> + * mtk_pci_atr_disable() - Disable all PCIe address translation rules
> + * @priv: MTK PCI private data
> + */
> +static void mtk_pci_atr_disable(struct mtk_pci_priv *priv)
> +{
> +       int port, tbl, offset;
> +       u32 val;
> +
> +       /* Disable all ATR table for all ports */
> +       for (port =3D ATR_SRC_PCI_WIN0; port <=3D ATR_SRC_AXIS_3; port++)
> +               for (tbl =3D 0; tbl < ATR_TABLE_NUM_PER_ATR; tbl++) {
> +                       /* Calculate table offset */
> +                       offset =3D ATR_PORT_OFFSET * port + ATR_TABLE_OFF=
SET * tbl;
> +                       val =3D mtk_pci_mac_read32(priv, REG_ATR_PCIE_WIN=
0_T0_SRC_ADDR_LSB + offset);
> +                       val =3D val & (~BIT(0));
> +                       /* Disable table by SRC_ADDR_L */
> +                       mtk_pci_mac_write32(priv, REG_ATR_PCIE_WIN0_T0_SR=
C_ADDR_LSB + offset, val);
> +               }
> +}
> +
> +/**
> + * mtk_pci_get_dev_state() - Read the device state from the modem
> + * @mdev: MTK MD device
> + *
> + * Return: Device state value.
> + */
> +u32 mtk_pci_get_dev_state(struct mtk_md_dev *mdev)
> +{
> +       return mtk_pci_mac_read32(mdev->hw_priv, REG_PCIE_DEBUG_DUMMY_7);
> +}
> +
> +/**
> + * mtk_pci_get_irq_id() - Map an IRQ source to its hardware IRQ ID
> + * @mdev: MTK MD device
> + * @irq_src: IRQ source enum
> + *
> + * Return: IRQ ID on success, -EINVAL on failure.
> + */
> +int mtk_pci_get_irq_id(struct mtk_md_dev *mdev, enum mtk_irq_src irq_src=
)
> +{
> +       int irq_id =3D -EINVAL;
> +
> +       if (irq_src > MTK_IRQ_SRC_MIN && irq_src < MTK_IRQ_SRC_MAX) {
> +               irq_id =3D mtk_pci_irq_tbl[irq_src];
> +               if (irq_id < 0 || irq_id >=3D MTK_IRQ_CNT_MAX)
> +                       irq_id =3D -EINVAL;
> +       }
> +
> +       return irq_id;
> +}
> +
> +/**
> + * mtk_pci_get_virq_id() - Get the Linux virtual IRQ for a hardware IRQ =
ID
> + * @mdev: MTK MD device
> + * @irq_id: Hardware IRQ ID
> + *
> + * Return: Virtual IRQ number on success, negative error code on failure=
.
> + */
> +int mtk_pci_get_virq_id(struct mtk_md_dev *mdev, int irq_id)
> +{
> +       struct pci_dev *pdev =3D to_pci_dev(mdev->dev);
> +       struct mtk_pci_priv *priv =3D mdev->hw_priv;
> +
> +       if (irq_id < 0 || irq_id >=3D priv->irq_cnt)
> +               return -EINVAL;
> +
> +       return pci_irq_vector(pdev, irq_id);
> +}
> +
> +/**
> + * mtk_pci_register_irq() - Register a callback for a hardware IRQ
> + * @mdev: MTK MD device
> + * @irq_id: Hardware IRQ ID
> + * @irq_cb: Callback function
> + * @data: Private data passed to callback
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int mtk_pci_register_irq(struct mtk_md_dev *mdev, int irq_id,
> +                        void (*irq_cb)(int irq_id, void *data), void *da=
ta)
> +{
> +       struct mtk_pci_priv *priv =3D mdev->hw_priv;
> +
> +       if ((irq_id < 0 || irq_id >=3D MTK_IRQ_CNT_MAX) || !irq_cb)
> +               return -EINVAL;
> +
> +       spin_lock(&priv->irq_cb_lock);
> +       if (priv->irq_cb_list[irq_id]) {
> +               spin_unlock(&priv->irq_cb_lock);
> +               dev_err(mdev->dev,
> +                       "Unable to register irq, irq_id=3D%d, it's alread=
y been register by %ps.\n",
> +                       irq_id, priv->irq_cb_list[irq_id]);
> +               return -EBUSY;
> +       }
> +       priv->irq_cb_data[irq_id] =3D data;
> +       smp_wmb(); /* Ensure data is visible before callback */
> +       WRITE_ONCE(priv->irq_cb_list[irq_id], irq_cb);
> +       spin_unlock(&priv->irq_cb_lock);
> +
> +       return 0;
> +}
> +
> +/**
> + * mtk_pci_unregister_irq() - Unregister a hardware IRQ callback
> + * @mdev: MTK MD device
> + * @irq_id: Hardware IRQ ID
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int mtk_pci_unregister_irq(struct mtk_md_dev *mdev, int irq_id)
> +{
> +       struct mtk_pci_priv *priv =3D mdev->hw_priv;
> +       int virq_id;
> +
> +       if (irq_id < 0 || irq_id >=3D MTK_IRQ_CNT_MAX)
> +               return -EINVAL;
> +
> +       if (!READ_ONCE(priv->irq_cb_list[irq_id])) {
> +               dev_err(mdev->dev, "irq_id=3D%d has not been registered\n=
", irq_id);
> +               return -ENOENT;
> +       }
> +
> +       /* mtk_pci_irq_handler() loads the callback and its data separate=
ly, so
> +        * the data may only be cleared once no handler can still hold a =
live
> +        * callback pointer.
> +        */
> +       mtk_pci_mask_irq(mdev, irq_id);
> +
> +       spin_lock(&priv->irq_cb_lock);
> +       WRITE_ONCE(priv->irq_cb_list[irq_id], NULL);
> +       spin_unlock(&priv->irq_cb_lock);
> +
> +       virq_id =3D mtk_pci_get_virq_id(mdev, irq_id);
> +       if (virq_id >=3D 0)
> +               synchronize_irq(virq_id);
> +
> +       priv->irq_cb_data[irq_id] =3D NULL;
> +
> +       return 0;
> +}
> +
> +/**
> + * mtk_pci_mask_irq() - Mask (disable) a hardware IRQ
> + * @mdev: MTK MD device
> + * @irq_id: Hardware IRQ ID
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int mtk_pci_mask_irq(struct mtk_md_dev *mdev, int irq_id)
> +{
> +       struct mtk_pci_priv *priv =3D mdev->hw_priv;
> +
> +       if (irq_id < 0 || irq_id >=3D MTK_IRQ_CNT_MAX) {
> +               dev_err(mdev->dev, "Failed to mask irq: input irq_id=3D%d=
\n", irq_id);
> +               return -EINVAL;
> +       }
> +
> +       mtk_pci_mac_write32(priv, REG_IMASK_HOST_MSIX_CLR_GRP0_0, BIT(irq=
_id));
> +
> +       return 0;
> +}
> +
> +/**
> + * mtk_pci_unmask_irq() - Unmask (enable) a hardware IRQ
> + * @mdev: MTK MD device
> + * @irq_id: Hardware IRQ ID
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int mtk_pci_unmask_irq(struct mtk_md_dev *mdev, int irq_id)
> +{
> +       struct mtk_pci_priv *priv =3D mdev->hw_priv;
> +
> +       if (irq_id < 0 || irq_id >=3D MTK_IRQ_CNT_MAX) {
> +               dev_err(mdev->dev, "Failed to unmask irq: input irq_id=3D=
%d\n", irq_id);
> +               return -EINVAL;
> +       }
> +
> +       mtk_pci_mac_write32(priv, REG_IMASK_HOST_MSIX_SET_GRP0_0, BIT(irq=
_id));
> +
> +       return 0;
> +}
> +
> +/**
> + * mtk_pci_clear_irq() - Clear (acknowledge) a hardware IRQ
> + * @mdev: MTK MD device
> + * @irq_id: Hardware IRQ ID
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int mtk_pci_clear_irq(struct mtk_md_dev *mdev, int irq_id)
> +{
> +       struct mtk_pci_priv *priv =3D mdev->hw_priv;
> +
> +       if (irq_id < 0 || irq_id >=3D MTK_IRQ_CNT_MAX) {
> +               dev_err(mdev->dev, "Failed to clear irq: input irq_id=3D%=
d\n", irq_id);
> +               return -EINVAL;
> +       }
> +
> +       mtk_pci_mac_write32(priv, REG_MSIX_ISTATUS_HOST_GRP0_0, BIT(irq_i=
d));
> +
> +       return 0;
> +}
> +
> +static u32 mtk_pci_map_evt_bit(u32 val, u32 from, u32 to)
> +{
> +       return (val & from) ? to : 0;
> +}
> +
> +static u32 mtk_pci_ext_d2h_evt_hw_bits(u32 chs)
> +{
> +       return mtk_pci_map_evt_bit(chs, DEV_EVT_D2H_BOOT_FLOW_SYNC,
> +                                  MHCCIF_EP2RC_EVT_BOOT_FLOW_SYNC) |
> +              mtk_pci_map_evt_bit(chs, DEV_EVT_D2H_ASYNC_HS_NOTIFY_SAP,
> +                                  MHCCIF_EP2RC_EVT_ASYNC_HS_NOTIFY_SAP) =
|
> +              mtk_pci_map_evt_bit(chs, DEV_EVT_D2H_ASYNC_HS_NOTIFY_MD,
> +                                  MHCCIF_EP2RC_EVT_ASYNC_HS_NOTIFY_MD);
> +}
> +
> +static u32 mtk_pci_ext_d2h_evt_chs(u32 hw_bits)
> +{
> +       return mtk_pci_map_evt_bit(hw_bits, MHCCIF_EP2RC_EVT_BOOT_FLOW_SY=
NC,
> +                                  DEV_EVT_D2H_BOOT_FLOW_SYNC) |
> +              mtk_pci_map_evt_bit(hw_bits, MHCCIF_EP2RC_EVT_ASYNC_HS_NOT=
IFY_SAP,
> +                                  DEV_EVT_D2H_ASYNC_HS_NOTIFY_SAP) |
> +              mtk_pci_map_evt_bit(hw_bits, MHCCIF_EP2RC_EVT_ASYNC_HS_NOT=
IFY_MD,
> +                                  DEV_EVT_D2H_ASYNC_HS_NOTIFY_MD);
> +}
> +
> +/**
> + * mtk_pci_register_ext_evt() - Register a callback for MHCCIF device ev=
ents
> + * @mdev: MTK MD device
> + * @chs: Bitmask of event channels to register; must not overlap the
> + *      channels of a callback already registered
> + * @evt_cb: Callback function, called from a work item with mhccif_lock
> + *         held: it must not (un)register MHCCIF callbacks
> + * @data: Private data passed to callback
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int mtk_pci_register_ext_evt(struct mtk_md_dev *mdev, u32 chs,
> +                            void (*evt_cb)(u32 status, void *data), void=
 *data)
> +{
> +       struct mtk_pci_priv *priv =3D mdev->hw_priv;
> +       struct mtk_mhccif_cb *cb;
> +       int ret =3D 0;
> +
> +       if (!chs || !evt_cb)
> +               return -EINVAL;
> +
> +       mutex_lock(&priv->mhccif_lock);
> +       list_for_each_entry(cb, &priv->mhccif_cb_list, entry) {
> +               if (cb->chs & chs) {
> +                       ret =3D -EBUSY;
> +                       dev_err(mdev->dev,
> +                               "Unable to register evt, intersection: ch=
s=3D0x%08x&0x%08x cb=3D%ps\n",
> +                               chs, cb->chs, cb->evt_cb);
> +                       goto err_unlock;
> +               }
> +       }
> +       cb =3D kzalloc(sizeof(*cb), GFP_KERNEL);
> +       if (!cb) {
> +               ret =3D -ENOMEM;
> +               goto err_unlock;
> +       }
> +       cb->evt_cb =3D evt_cb;
> +       cb->data =3D data;
> +       cb->chs =3D chs;
> +       list_add_tail(&cb->entry, &priv->mhccif_cb_list);
> +err_unlock:
> +       mutex_unlock(&priv->mhccif_lock);
> +
> +       return ret;
> +}
> +
> +/**
> + * mtk_pci_unregister_ext_evt() - Unregister an MHCCIF device event call=
back
> + * @mdev: MTK MD device
> + * @chs: Bitmask of event channels to unregister, exactly as registered
> + */
> +void mtk_pci_unregister_ext_evt(struct mtk_md_dev *mdev, u32 chs)
> +{
> +       struct mtk_pci_priv *priv =3D mdev->hw_priv;
> +       struct mtk_mhccif_cb *cb, *next;
> +
> +       if (!chs)
> +               return;
> +
> +       mutex_lock(&priv->mhccif_lock);
> +       list_for_each_entry_safe(cb, next, &priv->mhccif_cb_list, entry) =
{
> +               if (cb->chs =3D=3D chs) {
> +                       list_del(&cb->entry);
> +                       kfree(cb);
> +                       goto out;
> +               }
> +       }
> +       dev_warn(mdev->dev,
> +                "Unable to unregister evt, no chs=3D0x%08x has been regi=
stered.\n", chs);
> +out:
> +       mutex_unlock(&priv->mhccif_lock);
> +}
> +
> +/**
> + * mtk_pci_mask_ext_evt() - Mask (disable) MHCCIF device events
> + * @mdev: MTK MD device
> + * @chs: Bitmask of event channels to mask
> + */
> +void mtk_pci_mask_ext_evt(struct mtk_md_dev *mdev, u32 chs)
> +{
> +       u32 hw_bits =3D mtk_pci_ext_d2h_evt_hw_bits(chs);
> +
> +       mtk_pci_write32(mdev, MTK_MHCCIF_RC_BASE_ADDR +
> +                       MHCCIF_EP2RC_SW_INT_EAP_MASK_SET, hw_bits);
> +}
> +
> +/**
> + * mtk_pci_unmask_ext_evt() - Unmask (enable) MHCCIF device events
> + * @mdev: MTK MD device
> + * @chs: Bitmask of event channels to unmask
> + */
> +void mtk_pci_unmask_ext_evt(struct mtk_md_dev *mdev, u32 chs)
> +{
> +       u32 hw_bits =3D mtk_pci_ext_d2h_evt_hw_bits(chs);
> +
> +       mtk_pci_write32(mdev, MTK_MHCCIF_RC_BASE_ADDR +
> +                       MHCCIF_EP2RC_SW_INT_EAP_MASK_CLR, hw_bits);
> +}
> +
> +static u32 mtk_pci_ext_h2d_evt_hw_bits(u32 chs)
> +{
> +       return mtk_pci_map_evt_bit(chs, DEV_EVT_H2D_DEVICE_RESET,
> +                                  MHCCIF_RC2EP_EVT_DEVICE_RESET);
> +}
> +
> +/**
> + * mtk_pci_send_ext_evt() - Send an MHCCIF event to the modem
> + * @mdev: MTK MD device
> + * @ch: Event channel to trigger (must be a single bit)
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +static int mtk_pci_send_ext_evt(struct mtk_md_dev *mdev, u32 ch)
> +{
> +       u32 rc_base =3D MTK_MHCCIF_RC_BASE_ADDR;
> +       u32 hw_bits;
> +
> +       /* Only allow one ch to be triggered at a time */
> +       if (!is_power_of_2(ch)) {
> +               dev_err(mdev->dev, "Unsupported ext evt ch=3D0x%08x\n", c=
h);
> +               return -EINVAL;
> +       }
> +
> +       hw_bits =3D mtk_pci_ext_h2d_evt_hw_bits(ch);
> +       if (!hw_bits) {
> +               dev_err(mdev->dev, "Unmapped ext evt ch=3D0x%08x\n", ch);
> +               return -EINVAL;
> +       }
> +
> +       mtk_pci_write32(mdev, rc_base + MHCCIF_RC2EP_SW_BSY, hw_bits);
> +       mtk_pci_write32(mdev, rc_base + MHCCIF_RC2EP_SW_TCHNUM, ffs(hw_bi=
ts) - 1);
> +       return 0;
> +}
> +
> +static u32 mtk_pci_get_ext_evt_hw_status(struct mtk_md_dev *mdev)
> +{
> +       return mtk_pci_read32(mdev, MTK_MHCCIF_RC_BASE_ADDR +
> +                             MHCCIF_EP2RC_SW_INT_STS);
> +}
> +
> +static void mtk_pci_ack_ext_evt_hw(struct mtk_md_dev *mdev, u32 hw_bits)
> +{
> +       mtk_pci_write32(mdev, MTK_MHCCIF_RC_BASE_ADDR +
> +                       MHCCIF_EP2RC_SW_INT_ACK, hw_bits);
> +       /* Flush the ack before the callbacks run: one landing late would
> +        * erase an event they make the device raise.
> +        */
> +       mtk_pci_read32(mdev, MTK_MHCCIF_RC_BASE_ADDR +
> +                      MHCCIF_EP2RC_SW_INT_STS);
> +}
> +
> +/**
> + * mtk_pci_pldr() - Reset the modem via its ACPI MRST._RST method
> + * @mdev: MTK MD device
> + *
> + * Return:
> + * * 0       - Success, device was reset.
> + * * -ENODEV - No ACPI, no handle or no MRST._RST method.  Device
> + *             untouched.
> + * * -EIO    - MRST._RST failed.  Device untouched, still running;
> + *             a different reset may be attempted.
> + */
> +static int mtk_pci_pldr(struct mtk_md_dev *mdev)
> +{
> +       acpi_status acpi_ret;
> +       acpi_handle handle;
> +
> +       if (acpi_disabled) {
> +               dev_dbg(mdev->dev, "Unsupported, acpi function isn't enab=
le\n");

Go straight to the point: "ACPI is disabled\n"

> +               return -ENODEV;
> +       }
> +
> +       handle =3D ACPI_HANDLE(mdev->dev);
> +       if (!handle) {
> +               dev_dbg(mdev->dev, "Unsupported, acpi handle isn't found\=
n");
> +               return -ENODEV;
> +       }
> +       if (!acpi_has_method(handle, "MRST._RST")) {
> +               dev_dbg(mdev->dev, "Unsupported, pldr method isn't suppor=
ted\n");

"ACPI handle not found"

> +               return -ENODEV;
> +       }
> +       acpi_ret =3D acpi_evaluate_object(handle, "MRST._RST", NULL, NULL=
);
> +       if (ACPI_FAILURE(acpi_ret)) {
> +               dev_err(mdev->dev, "Failed to execute MRST._RST method: %=
s\n",
> +                       acpi_format_exception(acpi_ret));
> +               return -EIO;
> +       }
> +
> +       return 0;
> +}
> +
> +/**
> + * mtk_pci_link_check() - Check if the PCIe link to the modem is active
> + * @mdev: MTK MD device
> + *
> + * Return: true if the device is present, false otherwise.
> + */
> +static bool mtk_pci_link_check(struct mtk_md_dev *mdev)
> +{
> +       return pci_device_is_present(to_pci_dev(mdev->dev));
> +}
> +
> +static void mtk_mhccif_isr_work(struct work_struct *work)
> +{
> +       struct mtk_pci_priv *priv =3D
> +               container_of(work, struct mtk_pci_priv, mhccif_work);
> +       struct mtk_md_dev *mdev =3D priv->mdev;
> +       struct mtk_mhccif_cb *cb;
> +       u32 stat, mask, chs;
> +
> +       /* Clear level 1 before reading level 2: an event raised after th=
e
> +        * clear latches level 1 again and fires on the unmask below, one
> +        * raised before it is in the read.
> +        */
> +       mtk_pci_clear_irq(mdev, priv->mhccif_irq_id);
> +       stat =3D mtk_pci_get_ext_evt_hw_status(mdev);
> +       mask =3D mtk_pci_read32(mdev, MTK_MHCCIF_RC_BASE_ADDR
> +               + MHCCIF_EP2RC_SW_INT_EAP_MASK);
> +       if (unlikely(stat =3D=3D U32_MAX && !(mtk_pci_link_check(mdev))))=
 {
> +               /* When link failed, we don't need to unmask. */
> +               dev_err(mdev->dev, "Failed to check link in MHCCIF handle=
r.\n");
> +               return;
> +       }
> +
> +       stat &=3D ~mask;
> +       /* Acknowledge level 2 before dispatch: an event that re-asserts
> +        * while a callback runs must survive as a new status bit.
> +        */
> +       if (stat)
> +               mtk_pci_ack_ext_evt_hw(mdev, stat);
> +
> +       chs =3D mtk_pci_ext_d2h_evt_chs(stat);
> +       /* Callbacks must not modify mhccif_cb_list */
> +       mutex_lock(&priv->mhccif_lock);
> +       list_for_each_entry(cb, &priv->mhccif_cb_list, entry) {
> +               if (cb->chs & chs)
> +                       cb->evt_cb(cb->chs & chs, cb->data);
> +       }
> +       mutex_unlock(&priv->mhccif_lock);
> +
> +       mtk_pci_unmask_irq(mdev, priv->mhccif_irq_id);
> +}
> +
> +static const struct pci_device_id t9xx_pci_table[] =3D {
> +       { PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x0900),
> +         .class =3D MTK_PCI_CLASS, .class_mask =3D ~0 },
> +       { PCI_DEVICE(0x03f0, 0x01ca),  /* HP RMM-G4 */
> +         .class =3D MTK_PCI_CLASS, .class_mask =3D ~0 },
> +       {/* end: all zeroes */}
> +};
> +
> +MODULE_DEVICE_TABLE(pci, t9xx_pci_table);
> +
> +static int mtk_pci_atr_init(struct mtk_md_dev *mdev)
> +{
> +       struct pci_dev *pdev =3D to_pci_dev(mdev->dev);
> +       struct mtk_pci_priv *priv =3D mdev->hw_priv;
> +       struct mtk_atr_cfg cfg;
> +       int port, ret;
> +
> +       mtk_pci_atr_disable(priv);
> +
> +       /* Config ATR for RC to access device's register */
> +       cfg.src_addr =3D pci_bus_address(pdev, MTK_BAR_2_3_IDX);
> +       cfg.size =3D ATR_PCIE_REG_SIZE;
> +       cfg.trsl_addr =3D ATR_PCIE_REG_TRSL_ADDR;
> +       cfg.port =3D ATR_PCIE_REG_PORT;
> +       cfg.table =3D ATR_PCIE_REG_TABLE_NUM;
> +       cfg.trsl_id =3D ATR_PCIE_REG_TRSL_PORT;
> +       cfg.trsl_param =3D 0x0;
> +       cfg.transparent =3D 0x0;
> +       ret =3D mtk_pci_setup_atr(mdev, &cfg);
> +       if (ret)
> +               return ret;
> +
> +       /* Config ATR for EP to access RC's memory */
> +       for (port =3D ATR_SRC_AXIS_0; port <=3D ATR_SRC_AXIS_3; port++) {
> +               cfg.src_addr =3D ATR_PCIE_DEV_DMA_SRC_ADDR;
> +               cfg.size =3D ATR_PCIE_DEV_DMA_SIZE;
> +               cfg.trsl_addr =3D ATR_PCIE_DEV_DMA_TRSL_ADDR;
> +               cfg.port =3D port;
> +               cfg.table =3D ATR_PCIE_DEV_DMA_TABLE_NUM;
> +               cfg.trsl_id =3D ATR_DST_PCI_TRX;
> +               cfg.trsl_param =3D 0x0;
> +               /* Enable transparent translation */
> +               cfg.transparent =3D ATR_PCIE_DEV_DMA_TRANSPARENT;
> +               ret =3D mtk_pci_setup_atr(mdev, &cfg);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static int mtk_pci_bar_init(struct mtk_md_dev *mdev)
> +{
> +       struct pci_dev *pdev =3D to_pci_dev(mdev->dev);
> +       struct mtk_pci_priv *priv =3D mdev->hw_priv;
> +
> +       if (pci_resource_len(pdev, MTK_BAR_0_1_IDX) < MTK_BAR_0_1_MIN_LEN=
 ||
> +           pci_resource_len(pdev, MTK_BAR_2_3_IDX) < MTK_BAR_2_3_MIN_LEN=
) {
> +               dev_err(mdev->dev, "BARs too small for the register map\n=
");
> +               return -ENODEV;
> +       }
> +
> +       priv->mac_reg_base =3D pcim_iomap_region(pdev, MTK_BAR_0_1_IDX,
> +                                              KBUILD_MODNAME);
> +       if (IS_ERR(priv->mac_reg_base)) {
> +               dev_err(mdev->dev, "Failed to map BAR0/1\n");
> +               return PTR_ERR(priv->mac_reg_base);
> +       }
> +
> +       priv->bar23_addr =3D pcim_iomap_region(pdev, MTK_BAR_2_3_IDX,
> +                                            KBUILD_MODNAME);
> +       if (IS_ERR(priv->bar23_addr)) {
> +               dev_err(mdev->dev, "Failed to map BAR2/3\n");
> +               return PTR_ERR(priv->bar23_addr);
> +       }
> +
> +       /* We use MD view base address "0" to observe registers */
> +       priv->ext_reg_base =3D priv->bar23_addr - ATR_PCIE_REG_TRSL_ADDR;
> +
> +       return 0;
> +}
> +
> +static void mtk_mhccif_irq_cb(int irq_id, void *data)
> +{
> +       struct mtk_md_dev *mdev =3D data;
> +       struct mtk_pci_priv *priv;
> +
> +       priv =3D mdev->hw_priv;
> +       queue_work(system_highpri_wq, &priv->mhccif_work);
> +}
> +
> +static int mtk_mhccif_init(struct mtk_md_dev *mdev)
> +{
> +       struct mtk_pci_priv *priv =3D mdev->hw_priv;
> +       int ret;
> +
> +       INIT_LIST_HEAD(&priv->mhccif_cb_list);
> +       mutex_init(&priv->mhccif_lock);
> +       INIT_WORK(&priv->mhccif_work, mtk_mhccif_isr_work);
> +
> +       /* The write below goes through the BAR 2/3 ATR window, so this
> +        * function must run after mtk_pci_atr_init().
> +        * Mask every channel; consumers unmask the channels they need.
> +        * Do NOT ack here: EP2RC status bits are latched one-shot
> +        * notifications (e.g. BOOT_FLOW_SYNC raised before the driver
> +        * loads) that the device never re-sends.  Masking blocks
> +        * delivery but preserves the bit for delivery on unmask; an
> +        * ack would erase it and the boot flow would hang silently.
> +        */
> +       mtk_pci_write32(mdev, MTK_MHCCIF_RC_BASE_ADDR +
> +                       MHCCIF_EP2RC_SW_INT_EAP_MASK_SET, U32_MAX);
> +
> +       ret =3D mtk_pci_get_irq_id(mdev, MTK_IRQ_SRC_MHCCIF);
> +       if (ret < 0) {
> +               dev_err(mdev->dev, "Failed to get mhccif_irq_id. ret=3D%d=
\n", ret);
> +               return ret;
> +       }
> +       priv->mhccif_irq_id =3D ret;
> +
> +       ret =3D mtk_pci_register_irq(mdev, priv->mhccif_irq_id, mtk_mhcci=
f_irq_cb, mdev);
> +       if (ret) {
> +               dev_err(mdev->dev, "Failed to register mhccif_irq callbac=
k\n");
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static void mtk_mhccif_exit(struct mtk_md_dev *mdev)
> +{
> +       struct mtk_pci_priv *priv =3D mdev->hw_priv;
> +       struct mtk_mhccif_cb *cb, *tmp;
> +
> +       mtk_pci_unregister_irq(mdev, priv->mhccif_irq_id);
> +       cancel_work_sync(&priv->mhccif_work);
> +       /* The work unmasks the source on its way out, so leave it masked=
. */
> +       mtk_pci_mask_irq(mdev, priv->mhccif_irq_id);
> +
> +       list_for_each_entry_safe(cb, tmp, &priv->mhccif_cb_list, entry) {
> +               list_del(&cb->entry);
> +               kfree(cb);
> +       }
> +}
> +
> +static irqreturn_t mtk_pci_irq_handler(struct mtk_md_dev *mdev, u32 irq_=
state)
> +{
> +       struct mtk_pci_priv *priv =3D mdev->hw_priv;
> +       int irq_id;
> +
> +       /* Check whether each set bit has a callback, if has, call it */
> +       do {
> +               void (*cb)(int irq_id, void *data);
> +
> +               irq_id =3D fls(irq_state) - 1;
> +               irq_state &=3D ~BIT(irq_id);
> +               cb =3D READ_ONCE(priv->irq_cb_list[irq_id]);
> +               if (likely(cb)) {
> +                       smp_rmb(); /* Ensure data is read after callback =
*/
> +                       cb(irq_id, priv->irq_cb_data[irq_id]);
> +               } else {
> +                       dev_err_ratelimited(mdev->dev,
> +                                           "Unhandled irq_id=3D%d, no ca=
llback for it.\n",
> +                                           irq_id);
> +                       mtk_pci_clear_irq(mdev, irq_id);
> +               }
> +       } while (irq_state);
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t mtk_pci_irq_msix(int irq, void *data)
> +{
> +       struct mtk_pci_irq_desc *irq_desc =3D data;
> +       struct mtk_md_dev *mdev =3D irq_desc->mdev;
> +       struct mtk_pci_priv *priv;
> +       u32 irq_state, irq_enable;
> +
> +       priv =3D mdev->hw_priv;
> +       irq_state =3D mtk_pci_mac_read32(priv, REG_MSIX_ISTATUS_HOST_GRP0=
_0);
> +       irq_enable =3D mtk_pci_mac_read32(priv, REG_IMASK_HOST_MSIX_GRP0_=
0);
> +       irq_state &=3D irq_enable;
> +
> +       if (unlikely(irq_state =3D=3D U32_MAX && irq_enable =3D=3D U32_MA=
X))
> +               return IRQ_NONE; /* device gone */
> +
> +       irq_state &=3D irq_desc->msix_bits; /* scope to this vector */
> +       if (unlikely(!irq_state))
> +               return IRQ_NONE;
> +
> +       /* Mask the bit; the consumer unmasks it when it is done */
> +       mtk_pci_mac_write32(priv, REG_IMASK_HOST_MSIX_CLR_GRP0_0, irq_sta=
te);
> +
> +       return mtk_pci_irq_handler(mdev, irq_state);
> +}
> +
> +static int mtk_pci_request_irq_msix(struct mtk_md_dev *mdev)
> +{
> +       struct mtk_pci_priv *priv =3D mdev->hw_priv;
> +       struct mtk_pci_irq_desc *irq_desc;
> +       struct pci_dev *pdev;
> +       int ret, i;
> +
> +       pdev =3D to_pci_dev(mdev->dev);
> +       irq_desc =3D priv->irq_desc;
> +
> +       priv->irq_cnt =3D MTK_IRQ_CNT_MAX;
> +
> +       for (i =3D 0; i < MTK_IRQ_CNT_MAX; i++) {
> +               irq_desc[i].mdev =3D mdev;
> +               irq_desc[i].msix_bits =3D BIT(i);
> +               snprintf(irq_desc[i].name, MTK_IRQ_NAME_LEN, "msix%d-%s",=
 i, mdev->dev_str);
> +               ret =3D pci_request_irq(pdev, i, mtk_pci_irq_msix, NULL,
> +                                     &irq_desc[i], "%s", irq_desc[i].nam=
e);
> +               if (ret) {
> +                       dev_err(mdev->dev, "Failed to request %s: ret=3D%=
d\n",
> +                               irq_desc[i].name, ret);
> +                       for (i--; i >=3D 0; i--)
> +                               pci_free_irq(pdev, i, &irq_desc[i]);
> +                       return ret;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +static int mtk_pci_request_irq(struct mtk_md_dev *mdev)
> +{
> +       struct pci_dev *pdev =3D to_pci_dev(mdev->dev);
> +       int ret;
> +
> +       /* 32 vectors map 1:1 at the MAC's power-on default and the drive=
r
> +        * never merges them, so the MSI-X config register is left alone.
> +        */
> +       ret =3D pci_alloc_irq_vectors(pdev, MTK_IRQ_CNT_MAX,
> +                                   MTK_IRQ_CNT_MAX, PCI_IRQ_MSIX);
> +       if (ret < 0) {
> +               dev_err(mdev->dev,
> +                       "Unable to alloc %d MSI-X vectors: ret=3D%d\n",
> +                       MTK_IRQ_CNT_MAX, ret);
> +               return ret;
> +       }
> +
> +       return mtk_pci_request_irq_msix(mdev);
> +}
> +
> +static void mtk_pci_free_irq(struct mtk_md_dev *mdev)
> +{
> +       struct pci_dev *pdev =3D to_pci_dev(mdev->dev);
> +       struct mtk_pci_priv *priv =3D mdev->hw_priv;
> +       int i;
> +
> +       for (i =3D 0; i < priv->irq_cnt; i++)
> +               pci_free_irq(pdev, i, &priv->irq_desc[i]);
> +}
> +
> +static int mtk_pci_probe(struct pci_dev *pdev, const struct pci_device_i=
d *id)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct mtk_pci_priv *priv;
> +       struct mtk_md_dev *mdev;
> +       int ret;
> +
> +       mdev =3D devm_kzalloc(dev, sizeof(*mdev), GFP_KERNEL);
> +       if (!mdev) {
> +               ret =3D -ENOMEM;
> +               goto log_err;
> +       }
> +       mdev->dev =3D dev;
> +
> +       priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv) {
> +               ret =3D -ENOMEM;
> +               goto log_err;
> +       }
> +
> +       pci_set_drvdata(pdev, mdev);
> +       priv->mdev =3D mdev;
> +       mdev->hw_ver  =3D pdev->device;
> +       mdev->hw_priv =3D priv;
> +       strscpy(mdev->dev_str, pci_name(pdev), MTK_DEV_STR_LEN);

Do we really need this buffer to exist solely for IRQ names, can't we
simply use dev_name()?


> +
> +       ret =3D pcim_enable_device(pdev);
> +       if (ret) {
> +               dev_err(mdev->dev, "Failed to enable pci device.\n");
> +               goto log_err;
> +       }
> +
> +       ret =3D dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
> +       if (ret) {
> +               dev_err(mdev->dev, "Failed to set DMA Mask and Coherent. =
(ret=3D%d)\n", ret);
> +               goto log_err;
> +       }
> +
> +       ret =3D mtk_pci_bar_init(mdev);
> +       if (ret)
> +               goto log_err;
> +
> +       ret =3D mtk_pci_atr_init(mdev);
> +       if (ret)
> +               goto disable_atr;
> +
> +       spin_lock_init(&priv->irq_cb_lock);
> +
> +       ret =3D mtk_mhccif_init(mdev);
> +       if (ret)
> +               goto disable_atr;
> +
> +       /* Mask every source before the handlers go in, so a source
> +        * left enabled by firmware or a previous bind cannot fire
> +        * into a half-initialised driver.
> +        */
> +       mtk_pci_mac_write32(priv, REG_IMASK_HOST_MSIX_CLR_GRP0_0, U32_MAX=
);
> +
> +       ret =3D mtk_pci_request_irq(mdev);
> +       if (ret)
> +               goto free_mhccif;
> +
> +       if (!mtk_pci_link_check(mdev)) {
> +               ret =3D -ENOLINK;
> +               goto free_irq;
> +       }
> +
> +       pci_set_master(pdev);
> +       mtk_pci_unmask_irq(mdev, priv->mhccif_irq_id);
> +
> +       return 0;
> +
> +free_irq:
> +       mtk_pci_free_irq(mdev);
> +free_mhccif:
> +       mtk_mhccif_exit(mdev);
> +       pci_free_irq_vectors(pdev);
> +       priv->irq_cnt =3D 0;
> +disable_atr:
> +       mtk_pci_atr_disable(priv);
> +log_err:
> +       dev_err(dev, "Failed to probe device, ret=3D%d\n", ret);
> +
> +       return ret;
> +}
> +
> +static void mtk_pci_remove(struct pci_dev *pdev)
> +{
> +       struct mtk_md_dev *mdev =3D pci_get_drvdata(pdev);
> +       struct mtk_pci_priv *priv =3D mdev->hw_priv;
> +       struct device *dev =3D &pdev->dev;
> +       int i, ret;
> +
> +       /* Silence every source before tearing anything down. */
> +       mtk_pci_mac_write32(priv, REG_IMASK_HOST_MSIX_CLR_GRP0_0, U32_MAX=
);
> +
> +       /* Free the handlers before mtk_mhccif_exit() and the vectors aft=
er
> +        * it: MSI-X, and so INTx disable, stays on until the work is gon=
e.
> +        */
> +       mtk_pci_free_irq(mdev);
> +       mtk_mhccif_exit(mdev);
> +       pci_free_irq_vectors(pdev);
> +       priv->irq_cnt =3D 0;
> +       pci_clear_master(pdev);
> +       /* A dead link reads all-ones: keep the copy saved while it was u=
p. */
> +       if (mtk_pci_link_check(mdev))
> +               pci_save_state(pdev);
> +
> +       /* Reset last: the endpoint comes back at power-on defaults, so n=
o MMIO
> +        * and no MSI-X teardown may follow it.
> +        */
> +       ret =3D mtk_pci_pldr(mdev);
> +       if (!ret) {
> +               /* MRST._RST may return before the link has retrained, an=
d a
> +                * config write the device does not take is simply lost.
> +                */
> +               for (i =3D 0; i < MTK_PLDR_READY_POLLS && !mtk_pci_link_c=
heck(mdev); i++)
> +                       msleep(MTK_PLDR_READY_POLL_MS);
> +               if (!mtk_pci_link_check(mdev))
> +                       dev_warn(dev, "device not back %d ms after reset,=
 its config space may not be restored\n",
> +                                MTK_PLDR_READY_POLLS * MTK_PLDR_READY_PO=
LL_MS);
> +       } else if (!mtk_pci_link_check(mdev)) {
> +               dev_warn(dev, "PLDR failed (%d) and link is down, modem n=
ot reset\n", ret);
> +       } else {
> +               dev_warn(dev, "PLDR failed (%d), trying MHCCIF reset\n", =
ret);
> +               if (mtk_pci_send_ext_evt(mdev, DEV_EVT_H2D_DEVICE_RESET))=
 {
> +                       dev_err(dev, "MHCCIF reset failed\n");
> +               } else {
> +                       /* Unlike MRST._RST the doorbell returns before t=
he device
> +                        * has reset, and whether the link drops is up to=
 the
> +                        * firmware: wait a fixed time, then for a link t=
hat is
> +                        * still down to come back, before the restore be=
low.
> +                        */
> +                       msleep(MTK_MHCCIF_RESET_DELAY_MS);
> +                       for (i =3D 0; i < MTK_PLDR_READY_POLLS && !mtk_pc=
i_link_check(mdev); i++)
> +                               msleep(MTK_PLDR_READY_POLL_MS);
> +               }
> +       }
> +
> +       /* The reset returned the endpoint to its power-on defaults: put =
back
> +        * the saved config space for the next driver that binds.
> +        */
> +       pci_restore_state(pdev);
> +}
> +
> +/* A kexec reboot neither resets nor powers down the slot, and the boot
> + * notification the next kernel waits for is one-shot, so reset the mode=
m
> + * on the way down the same way remove() does.
> + */
> +static void mtk_pci_shutdown(struct pci_dev *pdev)
> +{
> +       if (kexec_is_in_progress())
> +               mtk_pci_remove(pdev);
> +}
> +
> +static pci_ers_result_t mtk_pci_error_detected(struct pci_dev *pdev,
> +                                              pci_channel_state_t state)
> +{
> +       struct mtk_md_dev *mdev =3D pci_get_drvdata(pdev);
> +
> +       dev_err(mdev->dev, "AER detected: pci_channel_state_t=3D%u\n", st=
ate);
> +
> +       /* AER recovery not supported, disconnect the device */
> +       return PCI_ERS_RESULT_DISCONNECT;
> +}
> +
> +static const struct pci_error_handlers mtk_pci_err_handler =3D {
> +       .error_detected =3D mtk_pci_error_detected,
> +};
> +
> +static struct pci_driver mtk_pci_drv =3D {
> +       .name =3D KBUILD_MODNAME,
> +       .id_table =3D t9xx_pci_table,
> +       .probe =3D mtk_pci_probe,
> +       .remove =3D mtk_pci_remove,
> +       .shutdown =3D mtk_pci_shutdown,
> +       .err_handler =3D &mtk_pci_err_handler
> +};
> +
> +module_pci_driver(mtk_pci_drv);
> +
> +MODULE_DESCRIPTION("MediaTek T9xx PCIe WWAN driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/net/wwan/t9xx/pcie/mtk_pci.h b/drivers/net/wwan/t9xx=
/pcie/mtk_pci.h
> new file mode 100644
> index 000000000000..36ab9d85417c
> --- /dev/null
> +++ b/drivers/net/wwan/t9xx/pcie/mtk_pci.h
> @@ -0,0 +1,139 @@
> +/* SPDX-License-Identifier: GPL-2.0-only
> + *
> + * Copyright (c) 2022, MediaTek Inc.
> + */
> +
> +#ifndef __MTK_PCI_H__
> +#define __MTK_PCI_H__
> +
> +#include <linux/mutex.h>
> +#include <linux/pci.h>
> +
> +#include "mtk_dev.h"
> +
> +enum mtk_irq_src {
> +       MTK_IRQ_SRC_MIN,
> +       MTK_IRQ_SRC_MHCCIF,
> +       MTK_IRQ_SRC_CLDMA0,
> +       MTK_IRQ_SRC_CLDMA1,
> +       MTK_IRQ_SRC_MAX
> +};
> +
> +enum mtk_atr_src_port {
> +       ATR_SRC_PCI_WIN0 =3D 0,
> +       ATR_SRC_PCI_WIN1,
> +       ATR_SRC_AXIS_0,
> +       ATR_SRC_AXIS_1,
> +       ATR_SRC_AXIS_2,
> +       ATR_SRC_AXIS_3,
> +};
> +
> +enum mtk_atr_dst_port {
> +       ATR_DST_PCI_TRX =3D 0,
> +       ATR_DST_AXIM_0 =3D 4,
> +};
> +
> +#define MTK_PCI_CLASS                 0x0D4000
> +
> +#define MTK_BAR_0_1_IDX                 0
> +#define MTK_BAR_2_3_IDX                 2
> +
> +#define MTK_IRQ_CNT_MAX                                32
> +#define MTK_IRQ_NAME_LEN                       32
> +
> +#define ATR_PORT_OFFSET                                0x100
> +#define ATR_TABLE_OFFSET                       0x20
> +#define ATR_TABLE_NUM_PER_ATR                  8
> +#define ATR_PCIE_REG_TRSL_ADDR                 0x10000000
> +#define ATR_PCIE_REG_SIZE                      0x00400000
> +#define ATR_PCIE_REG_PORT                      ATR_SRC_PCI_WIN0
> +#define ATR_PCIE_REG_TABLE_NUM                 1
> +#define ATR_PCIE_REG_TRSL_PORT                 ATR_DST_AXIM_0
> +#define ATR_PCIE_DEV_DMA_SRC_ADDR              0x00000000
> +#define ATR_PCIE_DEV_DMA_TRANSPARENT           1
> +#define ATR_PCIE_DEV_DMA_SIZE                  0
> +#define ATR_PCIE_DEV_DMA_TABLE_NUM             0
> +#define ATR_PCIE_DEV_DMA_TRSL_ADDR             0x00000000
> +
> +struct mtk_pci_irq_desc {
> +       struct mtk_md_dev *mdev;
> +       u32 msix_bits;
> +       char name[MTK_IRQ_NAME_LEN];
> +};
> +
> +struct mtk_pci_priv {
> +       struct mtk_md_dev *mdev;
> +       void __iomem *bar23_addr;
> +       void __iomem *mac_reg_base;
> +       void __iomem *ext_reg_base;
> +       int irq_cnt;
> +       /* irq_cb_lock: protects irq_cb_list[] and, on the register side,
> +        * irq_cb_data[].  mtk_pci_unregister_irq() clears irq_cb_data[]
> +        * after synchronize_irq() and outside the lock, because a handle=
r
> +        * past its READ_ONCE() of irq_cb_list[] still needs the data.
> +        * Callers must not register and unregister one irq_id concurrent=
ly.
> +        */
> +       spinlock_t irq_cb_lock;
> +       void *irq_cb_data[MTK_IRQ_CNT_MAX];
> +
> +       void (*irq_cb_list[MTK_IRQ_CNT_MAX])(int irq_id, void *data);
> +       struct mtk_pci_irq_desc irq_desc[MTK_IRQ_CNT_MAX];
> +       struct list_head mhccif_cb_list;
> +       /* mhccif_lock: lock to protect mhccif_cb_list */
> +       struct mutex mhccif_lock;
> +       struct work_struct mhccif_work;
> +       int mhccif_irq_id;
> +};
> +
> +struct mtk_atr_cfg {
> +       u64 src_addr;
> +       u64 trsl_addr;
> +       u64 size;
> +       u32 port;      /* Port number */
> +       u32 table;     /* Table number (8 tables for each port) */
> +       u32 trsl_id;
> +       u32 trsl_param;
> +       u32 transparent;
> +};
> +
> +/* BAR 0/1 MMIO access */
> +static inline u32 mtk_pci_mac_read32(struct mtk_pci_priv *priv, u64 addr=
)
> +{
> +       return ioread32(priv->mac_reg_base + addr);
> +}
> +
> +static inline void mtk_pci_mac_write32(struct mtk_pci_priv *priv, u64 ad=
dr, u32 val)
> +{
> +       iowrite32(val, priv->mac_reg_base + addr);
> +}
> +
> +/* BAR 2/3 MMIO access */
> +static inline u32 mtk_pci_read32(struct mtk_md_dev *mdev, u64 addr)
> +{
> +       return ioread32(((struct mtk_pci_priv *)mdev->hw_priv)->ext_reg_b=
ase + addr);
> +}
> +
> +static inline void mtk_pci_write32(struct mtk_md_dev *mdev, u64 addr, u3=
2 val)
> +{
> +       iowrite32(val, ((struct mtk_pci_priv *)mdev->hw_priv)->ext_reg_ba=
se + addr);
> +}
> +
> +/* Device operations */
> +u32 mtk_pci_get_dev_state(struct mtk_md_dev *mdev);
> +/* IRQ Related operations */
> +int mtk_pci_get_irq_id(struct mtk_md_dev *mdev, enum mtk_irq_src irq_src=
);
> +int mtk_pci_get_virq_id(struct mtk_md_dev *mdev, int irq_id);
> +int mtk_pci_register_irq(struct mtk_md_dev *mdev, int irq_id,
> +                        void (*irq_cb)(int irq_id, void *data), void *da=
ta);
> +int mtk_pci_unregister_irq(struct mtk_md_dev *mdev, int irq_id);
> +int mtk_pci_mask_irq(struct mtk_md_dev *mdev, int irq_id);
> +int mtk_pci_unmask_irq(struct mtk_md_dev *mdev, int irq_id);
> +int mtk_pci_clear_irq(struct mtk_md_dev *mdev, int irq_id);
> +/* External event related */
> +int mtk_pci_register_ext_evt(struct mtk_md_dev *mdev, u32 chs,
> +                            void (*evt_cb)(u32 status, void *data), void=
 *data);
> +void mtk_pci_unregister_ext_evt(struct mtk_md_dev *mdev, u32 chs);
> +void mtk_pci_mask_ext_evt(struct mtk_md_dev *mdev, u32 chs);
> +void mtk_pci_unmask_ext_evt(struct mtk_md_dev *mdev, u32 chs);
> +
> +#endif /* __MTK_PCI_H__ */
> diff --git a/drivers/net/wwan/t9xx/pcie/mtk_pci_reg.h b/drivers/net/wwan/=
t9xx/pcie/mtk_pci_reg.h
> new file mode 100644
> index 000000000000..a97ad6630dcf
> --- /dev/null
> +++ b/drivers/net/wwan/t9xx/pcie/mtk_pci_reg.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: GPL-2.0-only
> + *
> + * Copyright (c) 2022, MediaTek Inc.
> + */
> +
> +#ifndef __MTK_PCI_REG_H__
> +#define __MTK_PCI_REG_H__
> +
> +#define REG_ATR_PCIE_WIN0_T0_SRC_ADDR_LSB      0x0600
> +#define REG_ATR_PCIE_WIN0_T0_SRC_ADDR_MSB      0x0604
> +#define REG_ATR_PCIE_WIN0_T0_TRSL_ADDR_LSB     0x0608
> +#define REG_ATR_PCIE_WIN0_T0_TRSL_ADDR_MSB     0x060C
> +#define REG_ATR_PCIE_WIN0_T0_TRSL_PARAM                0x0610
> +#define REG_PCIE_DEBUG_DUMMY_7                 0x0D1C
> +#define REG_MSIX_ISTATUS_HOST_GRP0_0           0x0F00
> +#define REG_IMASK_HOST_MSIX_SET_GRP0_0         0x3000
> +#define REG_IMASK_HOST_MSIX_CLR_GRP0_0         0x3080
> +#define REG_IMASK_HOST_MSIX_GRP0_0             0x3100
> +
> +/* mhccif registers */
> +#define MHCCIF_RC2EP_SW_BSY                    0x4
> +#define MHCCIF_RC2EP_SW_TCHNUM                 0xC
> +#define MHCCIF_RC2EP_EVT_DEVICE_RESET          BIT(13)
> +
> +#define MHCCIF_EP2RC_SW_INT_STS                        0x10
> +#define MHCCIF_EP2RC_SW_INT_ACK                        0x14
> +#define MHCCIF_EP2RC_SW_INT_EAP_MASK           0x20
> +#define MHCCIF_EP2RC_SW_INT_EAP_MASK_SET       0x30
> +#define MHCCIF_EP2RC_SW_INT_EAP_MASK_CLR       0x40
> +#define MHCCIF_EP2RC_EVT_BOOT_FLOW_SYNC                BIT(5)
> +#define MHCCIF_EP2RC_EVT_ASYNC_HS_NOTIFY_SAP   BIT(15)
> +#define MHCCIF_EP2RC_EVT_ASYNC_HS_NOTIFY_MD    BIT(16)
> +
> +#endif /* __MTK_PCI_REG_H__ */
>
> --
> 2.34.1
>
>

