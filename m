Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D742C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Nov 2022 12:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vomVH4hGvaTNsTHXITvhcXN9JynH/ws7lJFxyIwVXrI=; b=oF2QbD/XRbWeutDs57oWrQa5+e
	neqQ7HLc8yF+IyD61b3T7NR1sn8YhkEuw8G0fFRqz0hX68BvZCf7AdFrAR2E3R+UQgZ4NajR9pJR+
	mGmq2GaHvGkTu9uvPIpRFOX2NYZTZ+ZqFZ1rNCwJuqux+ZsBtaJQNOUIrMpfHlZzYYwvGRNqY1D4Q
	KPtZjhrAOAPQ02mki60QbgN82wz0qssDeSFu1pNprV00gcZ0K8x92M31HWddarLpZTn2OXoR0n07c
	Qs7v5sKiZihIBRpN9VrucQgtjpqRKDnb/kZYI1dDKk7pDsbb0r1hy3xqIKwO5euONCrUfh3Ul2nQA
	9tg6nFVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otTIT-00FdUC-IN; Fri, 11 Nov 2022 12:38:13 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otTIQ-00FdSG-58; Fri, 11 Nov 2022 12:38:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1668170275;
	bh=vomVH4hGvaTNsTHXITvhcXN9JynH/ws7lJFxyIwVXrI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kZQLp5U7kMMYp6mfAsrl7LwptADZs8vfS+g5aOjUUxFrSMA447zx84J/9u/3CAxYk
	 z9JeXnY4AuuegECvKNk80p+rNKTxJZJPbEFRkDLh6kekj0XHLwxiuBTM9K80LWTIzs
	 qcMHJqyMHYKNJeOLP6BDMkv6CSAb7pw2OW1v9Y9d9MVqIRBOHvHvPf27tGV198QItG
	 pso7Ss/i5PzBvN7rB9oJPcnVuZAj70VL30OIeFedr3Ei15Kmvge8uzxgF3EWF0ZEft
	 pQC4lbStYnYVhfVpCR+1/u6DNuXRrxj6+fQoJEEBeZq9LGlOEaDIXV6x454Q9xhtcL
	 iHppbch+vzBzg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [157.180.224.127] ([157.180.224.127]) by web-mail.gmx.net
 (3c-app-gmx-bap63.server.lan [172.19.172.133]) (via HTTP); Fri, 11 Nov 2022
 13:37:55 +0100
MIME-Version: 1.0
Message-ID: <trinity-b1022e89-9e6b-417e-9506-431574251dc3-1668170275463@3c-app-gmx-bap63>
From: Frank Wunderlich <frank-w@public-files.de>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Frank Wunderlich <linux@fw-web.de>
Subject: Aw: Re:  [RFC v3 00/11] Add BananaPi R3
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Nov 2022 13:37:55 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <a34fd2d5-b7ed-2fea-7a6c-acc7659cb001@gmail.com>
References: <20221106085034.12582-1-linux@fw-web.de>
 <trinity-e9c6aa94-6656-4d9c-9d9b-90ede6c8e6fc-1668099812662@3c-app-gmx-bs29>
 <a34fd2d5-b7ed-2fea-7a6c-acc7659cb001@gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:qzBXiIbmK6VlpmlzQ8d/pWtwIGf1DVbX1BVamaBSp5KUXn5tY9cVbZSny9tIZlVHZ48zw
 m4pLYujy30CBnl5ZCRFMPVoBZnoCXRieIIqhDM36P11G6whstxQ6XptO9YpX+kxWWU9xqwQ2oYw1
 m15+CPDoMA4eENjC50kiSs7+AigLrXkZSkyzmJE3CuogagZ487oPOk7zDhP7PCnAhwZZA+o2HZOY
 BSbdgkBRfn0T7VcZXPDQKoqwBHfSPKl+TzwXf3QCTdyVwPKrRNWLXbx7mKy5FPlt94EHvrd0Lpuv
 EY=
UI-OutboundReport: notjunk:1;M01:P0:XUKcN6EumEM=;XqaSSbZ/dRE242s41zQECcN9B8U
 wc/UjnMHgeRHgRqMkiIGi60wLr3JIqNTxGOMrX8leR8PSh4roQy7TcmUGUup+PO/qiqiyFkmG
 8+cRSy7VcikF+LecZRCjyIUSZYy6hxyltkOHSuag4z/ymfNZq5GWXN8EsZVFCSqMkxsZYH8Ko
 NcnORU7vAQv1f6YAGdHOOtOms9qn1zvv3twqzeJ5PBgYg6pKVsWSGGi60M0Kl356TGVBbNmyl
 nNdppagaCMgzfObw4IAs31aJTDS4TJclAhPo9KuWdpY9pgJamZoVz3Hjv5UtzvaPraSmmml6w
 lgqQelRwRFGgv/sd6KmE9jele1CsNkylaIxfzdCX89GntbRqJDeM39xrIXRl1h4hFR4uQOmP3
 WJAQ+bqmc30fcZJFmDCWhowgVCLOksNfgonQE48Tf2SYKsOlT6jJmNQR0TyFchoeDdXDu68wy
 y3qCxdJjQNcJjTmf8X63TpiaehSIS4YZUcRo0c1QAtvCE5NBd4KayK8iT/yU3NBs9Z8iIscvA
 7YCKfGDlucJjtZjZUvj0pr22fOv11zTJgcAIzlArNvP+sW6UusFZ6w4ibbr0gXniGKBj3qLoK
 8CXBNJXCGw9IVuGQVSGeHnVXhPSKSFGadYGKh4FXkxdBd+tkyh0lJuxvcgnJG4xQ7/10EjNsE
 tGg6KcExo2KPGYtvd8tQvISLkbH55EKjDMnzfsLWXV4AGLvUpyGPXZgxJiN9xziGMRYLhtR9f
 uoHZczHnFlfSOC2Xvo0mIswxigdwkJVpOekKaU3RbAlfosGq+6BNqn/fLLyPtcCquxTE54DlF
 E2eLqnILjtYM0+lmR4O+vQoCx1H2ZkY6K1MuqPDKWbFC8=
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_043810_501205_5A5D04A1 
X-CRM114-Status: GOOD (  17.89  )
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

Hi

> Gesendet: Freitag, 11. November 2022 um 10:17 Uhr
> Von: "Matthias Brugger" <matthias.bgg@gmail.com>
> An: "Frank Wunderlich" <frank-w@public-files.de>, "Rob Herring" <robh+dt=
@kernel.org>
> Cc: linux-mediatek@lists.infradead.org, "Krzysztof Kozlowski" <krzysztof=
.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, devicetre=
e@vger.kernel.org, linux-kernel@vger.kernel.org, "Frank Wunderlich" <linux=
@fw-web.de>
> Betreff: Re: Aw: [RFC v3 00/11] Add BananaPi R3
>
>
>
> On 10/11/2022 18:03, Frank Wunderlich wrote:
> > Hi Rob,
> >
> > can you please take Patches 1+3 of v1 into your tree?
> > due to reordering in my tree i missed them in this version
> >
> > https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D685=
798
> >
>
> They should go through the subsystem maintainers trees. I'd advise to re=
send,
> dropping the RFC prefix and add the corresponding maintainers.

ok, wait for your push and i create v4 including the missing binding-patch=
es and the reorder of wed-node together with my fixes.

> Regards,
> Matthias
>
> > pcie-bindings are here:
> >
> > https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D690=
172
> >
> > i found 1 error in bpi-r3 dts (properties from sfp1 not plural) which =
i will fix in next version and will drop
> > the compile comment in dt overlays.
> >
> > also i've found this commit:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/=
?h=3Ddt/next&id=3D363547d2191cbc32ca954ba75d72908712398ff2
> >
> > so maybe i need to rename my overlay dts files to dtso?
> >
> > maybe the others can be applied (at least the mt7986 nodes)?

does this solve your question about dt-overlays?

just to note for all...it is all 1 board having sd+emmc on 1 mmc-controlle=
r and nand+nor on one spi. it depends on hardware-switches which devices a=
re accessable (1mmc+1 spi). Adding dts for all possible combinations will =
add more dts (sd+nor, sd+nand, emmc+nor, emmc+nand) than adding the 2 over=
lays or adds redundant config.

or should i copy the emmc/sd dts and adding once nor or nand? so we have t=
he dtsi and dts for combinations above (=3D5 total)?

> > regards Frank
>

