Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2F1C43217
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Nov 2022 17:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:To:Date:
	Message-Id:Subject:Mime-Version:Content-Transfer-Encoding:Content-Type:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=DeS404Azmkcjj38D6yYMoB4hKeikNwBwpEnERXLQQ50=; b=VPb8Sl7VNIDpIm8OsgfJabcdZa
	oxBHW2qPRWeJUcMsCHAnyvD0ppAMA5sn3ZZ9oecGO1uhPpXMgF5DBm/igh7a7F5utGcfqkRK6w1f7
	NwoO7ro7DlfO0FgBoCCynQ+gTdLHf5ROqlWc/th7czq/7kvomk2/pAPEefSKCBaXEKk+ZMpEYlp37
	tumHfYNxLjRsnH0q1HLRapZIIzLoab8Z78oOozXBk94jAKH2ux0XOjpgSJrdvT3PdHHTv0O6znh4m
	BtQo51yVye+Lpk2LuIcDDhm6UUTIR8RoZ3WD/LTSOnetQWyXQDWzlxHwQSwARmASntWUky+yosbuY
	AZ+Mu/6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqHDz-00CNHi-OW; Wed, 02 Nov 2022 17:08:24 +0000
Received: from sonic303-21.consmr.mail.ne1.yahoo.com ([66.163.188.147])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooQOT-0005w6-69
	for linux-mediatek@lists.infradead.org; Fri, 28 Oct 2022 14:31:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs.com; s=a2048; t=1666967488; bh=DeS404Azmkcjj38D6yYMoB4hKeikNwBwpEnERXLQQ50=; h=From:Subject:Date:To:References:From:Subject:Reply-To; b=cn7GYiSfuvS33RqhsuvSOGtdpM+83qF3nZtuntfW6RpSBu04TLW+dhm8aK2B8vcmVdvZW75xt8IMm/zBb3heAHsYvFVhltA3jPieej3r9yrAsPOEitwJUvEoOGu0Bil2KJIxLz4KjhQswkM65eB6G1Veh1FX5ZHkP/LI6czv75dfec0ucC3/rsw86A4BHTWD09yiDqf2q2k9L1W4cBec0LSP4M6kP4QjD3+l/LQveTkp0ttJ6dykr2ZI+iyQjn9SJa96MxIka8U89DD7twMmHfolVoP4OzY8qTn6mKIMMNBQd6SkWQe5ePi4GjkqAGXdsx+mAzeu+6dDN2IQWCkalA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1666967488; bh=7tP1JDRqCJ8IWpWHM2Xz8tJBKfx5o08Z5mD2+0TxmTg=; h=X-Sonic-MF:From:Subject:Date:To:From:Subject; b=Egtw0RvV02dG8GNFCClnLGHaOEtxK+7/dlysHzUvs9uj0sEtL2xFh0vig+zTpteqfUuPqDDrVN/x3mOMJuPxPSSYtFb5gxflRTKpwYx4H8x/2OWUwuOGleaxPAmUHhrECU5tFBmm9wEV516HC53gRclHrfmOIrmiZvC11Ltu1wlWkJX/Ne+5dwVowlCsuOpeZynwOnzVp8B5EXoatAI0oejvqdEKVupCeE+NeurPuGf44jIZfVGZdCq/ebNmuYtWMMCkRIbVXEKdXmVCSXKZhPz8Yo+rhSnMtjDpOgJfbtVOLtkBA2BDc7BpBaMq5VNF0heKxxElqZ1ikizp0ASEXQ==
X-YMail-OSG: ocHN7wYVM1nOvUuvOcnhqAJKNrYyWJXYFfEZZbEBIAhyiDaUsBsLdNW8lVhnZTI
 CJMUngjnFjuKgJww26pUSDjaQh32QF.oFqPWhNm80vFsw.VDtr0_8iSzDZCRMYBMEYFmZXGbLDwE
 aJFH459Xtv6q_y2ZtdID7HqoIF3xpgFLLx0pTmMR0thQe8Lnv08XI3W_MWROTv5_0obZA_FLXaIA
 M4ldqG2grMYZ6XsctzFLcQRF5ITacIErMopNn5XOXzdeLi26.LTkmUjirIjobUjTC.qL4vExH1QB
 8BOceS.eLm96kelu8acig67HTK_mOjkul8tRxzf6F3FLIaglb_ioX5LN3Jc48diY0YkBh76z.kvP
 VSEvxabnUnHp5Ii7S54d4p7YbX1Iiw2pbIYIIpLoMUKW3qrC95HLavfxCGdyWC6wQOh2TVgA2HFu
 c8Pxr_cSBIi06xrHhImCa4NZ44_f21XpDqZTFQ9j.NwDgfbSboJ5z3xfPTZBsxs1TV5LXesiFCW7
 PpZzdc0P7srn1xfqVwA9qWhRYFskXv3BzuCVaJdFW.0Ru5cQvr_0PUEh6j9AhBsI2q7ej68eqcs3
 2e11jS66xIqgpKC3AkxbS9tDQrarct4TeIShtdVMQkP._QvKLkuXoO3K8SNRqSD6rYnBjP75MZ6R
 MwwkLjYAC1UaiGtHWveSdTtjHqKgH7zAUWmyvZdY1k3rhYnJtcMwW_KQlY3IMXWI2iUZFgI7PqrH
 HQKCVYcR74UHeg0asSuBZItaL6hztamcFjCdlWK20Jbqm6VHvlhSBavOp50XuKV21Jxk.ZqFjfkQ
 BHb2rG7q4FdNBg8891IFnO.epQkGmhjJyV9CQf1rhZ96Iq23AlSW4eq6_6tmY2G43i5ogsXH44pS
 LVehuViHbXRTNOV16cq1RKFVQ.aC_YlUaEUGp2r9FSbou4ZBUxpVdnqGYcAqD4g3NgdraljizVOG
 NTrtUjiZhEeVgTriaN0PAdpD9gmGxOP0xeNo77USxZN6Xsr2dTWknyyAeJgNnrtNzH_La7wWLnPB
 8CMVSTR9jY2VTjNlxVv9GdXEzdqA5uCvYykUxwHPcGFnipfJkYzLg_6EbpmhweM7Pc.sWfSmPv6U
 jz.bu_knSvCIj.KWk28xtMXtUrTr.7TkA0E1BKP7ESkWhEC3Tpy8MK49IjXQF5XLz6rrGixGcFiC
 OCI9TOmNWFv..ekTGFBzbQZxOOJQiSOxyYtwWGnA4bVVt1xKy0xTf.V_PE5D3XrT_0kvi44Bdk9j
 1JUitNRyjBoDLq2ikbgCSwGbGQ3yElz1FcqCQhrIRG.7TSGxw0ZS0In8J68rv99FPwvjEx7LqkXA
 nkI7lQpjafW9yF0lfrT5Db3vt6Uo.2IKYYr2iDFBKd7Hr.JhZTJkAVZy_PyLaJDRU1qMmjiIV3mB
 KvoNncAnM2gKcUMKwqEnA_FKPWwmPGjISxH4QIPR6lcry1FMfy0__ndC0RoLEJ4l8Tuoynyps5rV
 DSLSGqii2__Pk3UTVFHVYZk6SMRvARBgFgpgWbchB_ubYWdPv2_XVgcEjeiSRxz0PU0ZX3y3I_Ag
 XdDr2bN3.31Q_esTmbugRpMTWNfNs3obx2WJOWLE9WCsfZLOhXc_hcrflkdmqf9qhq1ZJ9zJ5APp
 2ZDBvu86QEvoEoZ3EKG5blsaZLcRqYLa_CQn6vgHmcQJW4b__OrNYzV7NiUE2BzBG4FpgxrVGOQw
 WvAwtBJ5Gojn1YzY4r6tmbVMyQY0a3nguJw4ng6LU_jXK7rXSaAlb9JwC1XKS.euCzMS_ahvzGMm
 dt7XOUr8Q.qNOB4aZcafZLdngD0rekaHPk5gCObz27.L7muu4tSgvWo815Qzx_FMwRf8HjICogMy
 VqTYCZwC.1gPY6hBcLPxPFU17vk5uEBWg0JEX94dMFI5NyI8LsgpAv0P_j0oLpTAfyWoDDItNb5S
 JZS1l.TM6F0Js9cjPLczODnEjVGzvz.B81Z2yqhbuoEBW0nUY7yUnb0fIbjJq49OU69hb6TjNDDf
 9jIhiKImgTqZigaZmp3Upw20RBaLuHFa7Ksn6LXM2fo8.3NfyaMdPAiq56q3ZCVUPwTG0eb3zBKT
 o3pSCFJ8BuEvzIr2OCh09RUietL3_i255RLnd1pzw_hvIklw30w9Y_PV8OOTGjYCvn3cnvnEqvnN
 ITViZSnkQb.sUB2KTxz5uUYiOEcd3qCVFCBGOtj8z75XCDEmp0OuQTP5nSNWtig--
X-Sonic-MF: <vschagen@cs.com>
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.ne1.yahoo.com with HTTP; Fri, 28 Oct 2022 14:31:28 +0000
Received: by hermes--production-ir2-96dfb7869-tzc7l (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 4dcfdd5907d826a80d2570d3d6f84b19;
          Fri, 28 Oct 2022 14:21:13 +0000 (UTC)
From: "R.W. van Schagen" <vschagen@cs.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: Special Tag RT3052 vs RT5350 and MT76x8 
Message-Id: <EA7970C2-E544-4DEC-AF46-069B7536DAC9@cs.com>
Date: Fri, 28 Oct 2022 16:21:00 +0200
To: linux-mediatek@lists.infradead.org
X-Mailer: Apple Mail (2.3731.200.110.1.12)
References: <EA7970C2-E544-4DEC-AF46-069B7536DAC9.ref@cs.com>
X-Bad-Reply: References but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_073133_323183_41C34C47 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Wed, 02 Nov 2022 10:08:23 -0700
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

I am trying to write a DSA driver for the MT76x8 and hopefully have it =
compatible with the RT5350 and even the RT3052.

I can=E2=80=99t figure out what the difference is between the RT3052 =
which states for the SGC2 register (101100E4) that it is TX but RT5350 =
and MT7628 say TX/RX implying that I could also use the TAG to steer =
egress to specific port??

For having only the TAG towards the CPU port is enough DSA and use the =
FDB to steer egress packets. This works perfectly without VLAN =
membership checking on the front facing ports and have the Linux Bridge =
vlan unaware (vlan_filtering 0). The switch inserts the PVID with a port =
Tag. But as soon as I enable vlan filtering on the switch (reg 10110014 =
PFC1) I get filtering but loose the TAG (all show as x8100). However if =
I enable TX on the same port, the switch is inserting the proper Tag but =
this also gets transmitted out of any other port that is part of the =
same VLAN VID and thus doesn=E2=80=99t get recognised by any other =
device.

Can any of the Mediatek people share some insights on this problem? How =
do I get vlan membership checking AND the special Tag at the same time =
but only transmitted to the CPU port?

Thanks very much!=

