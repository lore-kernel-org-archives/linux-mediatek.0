Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B67EB64DA
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jul 2023 12:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/q5vPysvgwOOLB/JiDSQP3eCYUz8RtczsHjvgeJg1Gk=; b=s3TC0hD4lBnts4C7LqPVCF1JDC
	yScUHDPMymsP/KyY2PGgef98L+avXGdhN0i7Rujro/QLyZ765Ort8yvvlKPAqirAy8cYWgvuDtO+I
	xX4io3tdCUTAY6/f1RlN1ZnLOfvr9KTLfByxg47/RW/GZ4a418rP1Tbzp9APtQjI4ysepjkLPOUOB
	ltSPZpuBFLm2Lz69x1R38r8kV5ElIDtz/nYHmk9WH1NNfN/a0S3N3girBfWe+hWV2sUW/qdnJnPmc
	0ML+pTS+BJp+umur0MbM1O2GqYij9YSgQosYAyvoEIvZlR11UmSPiZylfccG2F/fBaIDPmlWb1boU
	oXV1thRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNBUl-00Gf6R-0X;
	Sat, 22 Jul 2023 12:13:59 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNBUi-00Gf5D-0A;
	Sat, 22 Jul 2023 12:13:57 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1690028033; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=K9sEHU0nSLpZWOtlzt7nIwZkjo+ZUtg78DQ/J4Yvi1oWAF6zUNIVnrePOCeid8205wlTCAvuMFQpdmN9dGgqaRpA7+JtelbeHK5jLr6tdaZIrugwvWBWEJuHxL4B8cY2s4LDPU5w/b09PYsRXwNXEUeY2Qyq3P151V3NyyVznhQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1690028033; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=/q5vPysvgwOOLB/JiDSQP3eCYUz8RtczsHjvgeJg1Gk=; 
	b=NqlQ4pNMTfCJryi0iHfTEu26624SDvrEBlEzAgkVxRvRNGyIN2C2M7QyBA5HRMEiAInmnOLXehEd8QYRHWyMCPUwZfgPL+NVU2dbqi2CRFFoEbazHbARx0eCuYorCv86YeKJj2XiaxmFr/mucSGvn5SA06aal3skpuR5BYCwre4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1690028033;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=/q5vPysvgwOOLB/JiDSQP3eCYUz8RtczsHjvgeJg1Gk=;
	b=APWVV1qoE4xWaSouk8cls37oMN6w/9JdpLHTEFaWangCnhDpkFSo1uUGxs/P/F2j
	a0Oh5SgwYVvRcWeHgZvSTCoxeHf/6Bxx/iQnLPO4Ur/JaDP8rOCpXmtjajkNPn9yNre
	djLfjJUmLHWqSrqrFZcPiJ+4O6jkOzMAjyctQHynimWoAsULuj288qDmpjeco4pTlaX
	egrpK2+0KvycN9jDJ1Qf8qWUBfXbea1zw6lwKxqZ1v8/qkPsYk+vLjU9kR9mondBRYl
	O4M3Mf9R6+eELzTC3U0wWneA2hRAyruPPQNNV8PSMCvNWwbvbCXtwL9cCZabWbZj9zY
	qsa7kpGdCA==
Received: from edelgard.fodlan.icenowy.me (120.85.97.227 [120.85.97.227]) by mx.zohomail.com
	with SMTPS id 1690028030544550.8527003226176; Sat, 22 Jul 2023 05:13:50 -0700 (PDT)
Message-ID: <05e6d2d6dd8805c4cded28f85ac873b96bc1467e.camel@icenowy.me>
Subject: Re: [PATCH 0/2] thermal/drivers/mediatek: fix a regression
 affecting other subsystems
From: Icenowy Zheng <uwu@icenowy.me>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>, Zhang Rui
 <rui.zhang@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Kang
 Chen <void0red@hust.edu.cn>, Dongliang Mu <dzm91@hust.edu.cn>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Sat, 22 Jul 2023 20:13:45 +0800
In-Reply-To: <40546a57-27ac-8bf9-a2d8-77f7d4ab4aad@linaro.org>
References: <20230529162056.3786301-1-uwu@icenowy.me>
	 <40546a57-27ac-8bf9-a2d8-77f7d4ab4aad@linaro.org>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_051356_143643_D072980E 
X-CRM114-Status: GOOD (  20.03  )
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

=E5=9C=A8 2023-06-13=E6=98=9F=E6=9C=9F=E4=BA=8C=E7=9A=84 10:44 +0200=EF=BC=
=8CDaniel Lezcano=E5=86=99=E9=81=93=EF=BC=9A
> On 29/05/2023 18:20, Icenowy Zheng wrote:
> > In the commit I reverted as the first commit of this patchset, the
> > of_iomap function call, which allows multiple mapping of the same
> > physical memory space, is replaced to calling devm_of_iomap, which
> > registers exclusivity, and on my system (mt8173-elm), preventing
> > display
> > from working.
> >=20
> > So I reverted it, and to really solve the problem that the original
> > commit wants to solve, I read the source of auxadc-thermal and
> > realized
> > that the address of these two memory blocks are not saved after
> > probe,
> > and they're only used when initializing the thermal sensors. This
> > leads
> > to my final fix, which is the second commit here, that adds
> > of_iounmap
> > just to the probe function.
> >=20
> > Icenowy Zheng (2):
> > =C2=A0=C2=A0 Revert "thermal/drivers/mediatek: Use devm_of_iomap to avo=
id
> > resource
> > =C2=A0=C2=A0=C2=A0=C2=A0 leak in mtk_thermal_probe"
> > =C2=A0=C2=A0 thermal/drivers/mediatek: unmap foreign MMIO after probing
> >=20
> > =C2=A0 drivers/thermal/mediatek/auxadc_thermal.c | 46 ++++++++++++-----=
-
> > -----
> > =C2=A0 1 file changed, 24 insertions(+), 22 deletions(-)
>=20
> I'll apply only the revert and let you revisit the patch 2 which
> could=20
> be improved.

Sorry, is the first patch applied? I didn't see it in any kernel
trees...

I have no current idea about how to fix in patch 2.

>=20


