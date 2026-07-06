Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7081EC43458
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2026 17:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2R7RMzgtl4p0GUyY1wULxMAxNHG70RoVQmfeFubRL8=; b=gGTznDFqxKvH4N9+pqQH5nI+SG
	o1QZQi8vmLq+ytLBjuzbC8Wo4NN3k9j2h1ZfeMP43W7SKXu/Nfrq6FMsYmKEduNGoI4Z99JpS1Ne4
	/jgqVdrdS36NlND+n5UyskdB+xsOeVrK6vdvE1RYKfXX8Fj4YUKUyVJLDxm7HmCDxwHvdiGKWLCRr
	veevgL9ckwh7d3DRCwqZ1lsLAWondOhyhdTQjvOQoAN4w5tFploFKXfjVnih0vxY1SnckG+8UyFqH
	S5v5/0na0MRAIz+JmYIsEweB3xx5HwcKavdfQ1FbKCdJYYgpEqSz9xcpzHquWVpmoKBKaFSKKlCo/
	z8FfcgNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnGM-0000000DDVG-0bsF;
	Mon, 06 Jul 2026 17:37:46 +0000
Received: from mail-24418.protonmail.ch ([109.224.244.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnGI-0000000DDUO-2yn7;
	Mon, 06 Jul 2026 17:37:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1783359456; x=1783618656;
	bh=v2R7RMzgtl4p0GUyY1wULxMAxNHG70RoVQmfeFubRL8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Tmwz7SmHDAgLUbBdkKgYKpJS7gp59kkKj6XRcI2cpJdIOO9cBKlV0r14p9wHsP4zH
	 b0dOACHWQ3AHO9qcXZmjzwPPlM20znCP9hiR/NrvjwKfsUMcw/fXVOCMc68m88bNvh
	 x0ErvReN98A48O/teawZ9bv7Fs09pMTfd+w+izmN/j6gHmFq26/4wKoNQi9jW4VdOc
	 luyEcOG8T4e9IVdV2LV1yfiidJ8MvkaeASsTcCagXZdubT4W3MUQXF4iV6CvhGnnjh
	 9yZBn0fc6TdEWmlvgYoZKVCN2fN+btC3fpmF7jwR80JwhlurzVYWkqXH7F7pl9qvAf
	 t9MKIMhCdmlTQ==
Date: Mon, 06 Jul 2026 17:37:28 +0000
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
From: Zakariya Hadrami <zkh1@proton.me>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, Zakariya Hadrami <zkh1@proton.me>
Subject: Re: [PATCH v2 0/5] ARM: Basic support for Amazon ford tablet (MT8127)
Message-ID: <20260706-mt8127-amazon-ford-basic-v2-0-akvkMzQcnDB-79Ya@proton.me>
In-Reply-To: <20260617-mt8127-amazon-ford-basic-v2-0-6859e29e72a8@proton.me>
References: <20260617-mt8127-amazon-ford-basic-v2-0-6859e29e72a8@proton.me>
Feedback-ID: 198761268:user:proton
X-Pm-Message-ID: 879d977e9a35ea1cee412757959b56d4f370c935
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_103743_538511_4AE63564 
X-CRM114-Status: UNSURE (   5.06  )
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

Hi everyone,

Gentle ping regarding the last 3 patches of this v2 series. First two docum=
entation
patches were kindly reviewed respectively by Mr. Roeck and Mr. Kozlowski.

Link to the full v2 series thread:
=09https://lore.kernel.org/all/20260617-mt8127-amazon-ford-basic-v2-0-6859e=
29e72a8@proton.me

Thank you very much.

--=20
Best regards,
Zakariya


