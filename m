Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A33E810D9
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Sep 2023 12:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NuCL+Ul/0dtzEbUBik1/xqBHCY4XgXXsKJePOuodXgc=; b=MMGzcflRgI0aN+AIdlRlN/P/e9
	f/DkNO75NcfYenxyora3IlLIMSKAAIZdmbBo27jprBmdP5UBUTNVi/FpZtffky+PfqlA0myjHn1Hg
	EeqlF+WsEixf2hx5nUyoFa/GIyugOVQRn8WN69GsBCyRcGntVZMWcN7vWFe5pxKnzqb9R4SH6grAZ
	EpTh/4vo8gCMaeD3brIZGlp6Y4XOQXGPDfRu2/2JC3pieL3bly6jT9RU3lbw44czdo3MmBwT30tZm
	jpls5lVvwR7KjABouSS9G9JYdc3s/slx7qoprJzTaPHpESU11IPjTmIjZFbtffn1syQ3A9U7yQ4nR
	4lfXGLNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlTMP-000qvM-18;
	Wed, 27 Sep 2023 12:09:45 +0000
Received: from m1-bln.bund.de ([77.87.224.105])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlTMJ-000qtX-0q
	for linux-mediatek@lists.infradead.org;
	Wed, 27 Sep 2023 12:09:43 +0000
Received: from m1-bln.bund.de (localhost [127.0.0.1])
	by m1-bln.bund.de (Postfix) with ESMTP id 6AFE8AB588
	for <linux-mediatek@lists.infradead.org>; Wed, 27 Sep 2023 14:09:33 +0200 (CEST)
Received: (from localhost) by m1-bln.bund.de (MSCAN) id 6/m1-bln.bund.de/smtp-gw/mscan;
     Wed Sep 27 14:09:33 2023
X-NdB-Source: NdB
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/simple; d=itzbund.de;
	s=230316-2017-ed25519; t=1695816564;
	bh=NuCL+Ul/0dtzEbUBik1/xqBHCY4XgXXsKJePOuodXgc=;
	h=Date:From:To:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Autocrypt:Cc:Content-Transfer-Encoding:
	 Content-Type:Date:From:In-Reply-To:Mime-Version:Openpgp:References:
	 Reply-To:Resent-To:Sender:Subject:To;
	b=cMueZAlm6qqsYGo5NFRCZUYMy9U+6m6iL2C4W8WLGo7Bz20f8b/aJ6pjz084D0kVG
	 VK+aARURJGM694RHFiXBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=itzbund.de;
	s=230316-2017-rsa; t=1695816564;
	bh=NuCL+Ul/0dtzEbUBik1/xqBHCY4XgXXsKJePOuodXgc=;
	h=Date:From:To:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Autocrypt:Cc:Content-Transfer-Encoding:
	 Content-Type:Date:From:In-Reply-To:Mime-Version:Openpgp:References:
	 Reply-To:Resent-To:Sender:Subject:To;
	b=giWCImiFgrX1ztqotQ5AaiWeYRlI6Dyv2nQBrG7DdKkyLbFt7igjikBdicsqlY2ag
	 24ICDX4JqFpZthevv18jELt204b+jGpVh9JY68Uro1/nTUcSGMHZmAl86/cpp6rbXW
	 A6Ud8RoxmUuS7MWNuTgfGxK7kdkNwGfxBo7opzu9phUHDdPo9xVOrNdaKkoEn7+Gkd
	 8RqRzVx4WBQ6TFULqFSwlLarkWLCByZxdcKGTzpo25SPLLbTldLYhnl+VBudW4Cy44
	 VcCGH/BGaGREyUn/Ez2V6N6pKxuMM3zb80z4KaAZ9AUMCXSJ4TQw9x6KWGAwXSR1vf
	 RQI1AJjY3PhIQ==
X-P350-Id: 28a0dba0e2122a38
Date: Wed, 27 Sep 2023 14:09:23 +0200
From: E-Mail-Administration ITZBund <noreply@itzbund.de>
To: linux-mediatek@lists.infradead.org
Subject: Ihre E-Mail konnte nicht zugestellt werden
Message-ID: <20230927120923.GA4198@vlp22140.prod.groupware.itz.itzbund.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-Rusd: domwl, Pass through domain itzbund.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_050940_542273_A52C0344 
X-CRM114-Status: UNSURE (   0.05  )
X-CRM114-Notice: Please train this message.
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

Sehr geehrte Damen und Herren,

bitte antworten Sie nicht auf diese Benachrichtigung. Kontaktm=F6glichkeite=
n entnehmen Sie bitte der E-Mail-Signatur.

Aufgrund eines Zertifikatsproblems auf einem Antivirus-Gateway des ITZBund =
konnten E-Mails nicht zugestellt werden. Diese Nachrichten sollten daher no=
ch einmal versendet werden.

Sie erhalten diese Benachrichtigung, da Ihre E-Mail-Adresse in einer der fr=
aglichen Nachrichten enthalten war. Nachfolgend finden Sie die Einzelheiten=
 zu dieser E-Mail:

Datumsstempel: 25.09.2023 11:48

Absender: joro@8bytes.org
Empf=E4nger: samuel@sholland.org, mpe@ellerman.id.au, christophe.leroy@csgr=
oup.eu, orsonzhai@gmail.com, jsnitsel@redhat.com, angelogioacchino.delregno=
@collabora.com, linux-sunxi@lists.linux.dev, matthias.bgg@gmail.com, digetx=
@gmail.com, yong.wu@mediatek.com, jonathanh@nvidia.com, linux-arm-kernel@li=
sts.infradead.org, mjrosato@linux.ibm.com, jernej.skrabec@gmail.com, baolu.=
lu@linux.intel.com, krzysztof.kozlowski@linaro.org, jgg@nvidia.com, thierry=
=2Ereding@gmail.com, alim.akhtar@samsung.com, will@kernel.org, m.szyprowski=
@samsung.com, nicolinc@nvidia.com, linux-mediatek@lists.infradead.org, ande=
rsson@kernel.org, agross@kernel.org, linux-tegra@vger.kernel.org, linuxppc-=
dev@lists.ozlabs.org, extern.martin.grimm@itzbund.de, treding@nvidia.com, k=
onrad.dybcio@linaro.org, baolin.wang@linux.alibaba.com, npiggin@gmail.com, =
kevin.tian@intel.com, linux-s390@vger.kernel.org, linux-samsung-soc@vger.ke=
rnel.org, linux@armlinux.org.uk, zhang.lyra@gmail.com, steven.price@arm.com=
, schnelle@linux.ibm.com, gerald.schaefer@linux.ibm.com, linux-rockchip@lis=
ts.infradead.org, iommu@lists.linux.dev, vdumpa@nvidia.com, heiko@sntech.de=
, linux-arm-msm@vger.kernel.org, robin.murphy@arm.com, wens@csie.org, robdc=
lark@gmail.com

Betreff: 'Re: [PATCH v8 00/24] iommu: Make default_domain's mandatory'

Sollten Sie der Absender sein, so erw=E4gen Sie bitte den erneuten Versand.=
 In dem Fall, da=DF Sie diese E-Mail h=E4tten erhalten sollen, informieren =
Sie bitte den Absender =FCber Ihren Wunsch, die E-Mail erneut zu versenden.

Wir m=F6chten uns f=FCr die Unannehmlichkeiten entschuldigen.

F=FCr R=FCckfragen steht Ihnen die E-Mail-Administration des ITZBund gerne =
zur Verf=FCgung.


Freundliche Gr=FC=DFe

Ihre E-Mail-Administration
_______________________________________
V A 51 40 - Gateway-Systeme und Schnittstellen
Informationstechnikzentrum Bund (ITZBund)

Postanschrift: Postfach 301645, 53196 Bonn
E-Mail: VA5140@itzbund.de


