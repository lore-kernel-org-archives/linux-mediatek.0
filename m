Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4ADDC05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Jan 2023 08:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P2YGMvOkJJ3edSwKTwvliLo6LlI8cpRsq5B4Ascd4k8=; b=gKV7ttrHWpZ5ByAbkfFToR5a/l
	0MjKlnEHDDHODsG3RJMSntMx+JmkGjjof414hVBbFAX417fnM8FPRZ/V3eIpbL5ObD8Hbc7Fr+emC
	IZ4K4df673DIuYxsSKolf6iFvK/CF0tQ/GdSiH/Nk2ZodKxzqisMI49IeC9QykpdFpcWqfAVoiClj
	itOgy3gPuZWqL3wyqDFuPAk8EKBsdx1pAxJEACW7OVipMhzU0tenASPdHTE9IrC3UAxQB5jwFK7F1
	10gEFFq+BCBTfhBA3RnJu/kWIExv5W60HW/kIrR37rEQp0K2Zbw5rKW/TyZxOOfdoZPmKsqhTOJf2
	HQ3Kai7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIme8-0090xt-0N; Fri, 20 Jan 2023 08:21:12 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pImdw-0090ug-TE; Fri, 20 Jan 2023 08:21:02 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id A129B123C;
	Fri, 20 Jan 2023 09:20:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1674202858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P2YGMvOkJJ3edSwKTwvliLo6LlI8cpRsq5B4Ascd4k8=;
	b=ZPL0LXsWKcu3D45/yajKnPOECCDYC4/69KzUOf8VExmhzWgBQeiwLe10pqdeS/ILOZYl5o
	+LquF8+/m5x66baKOoiOXaCyq0bC/l9z3m6JkYSFLefvPsH3bbkYZMtgTsqZrxBum5Ay5T
	H98sGqYoJy4Wym+AD1y4wFyIAFVTxGeL1F8XtSkWUKoh03NxDJ+Ik7o9mpe5e4oYguJsT8
	8wLgn37Mh7JrXqaSjwhLqWX3udnHWDmxMpzqvpcvbojef6D2LQz8RvM4RAcOl1Og9SaFi0
	9yUp7ce6WUwnhDgwmyvi5uJjOxQ+o/X425xY7st62PYSoHCdr2cV03VLCoE11Q==
From: Michael Walle <michael@walle.cc>
To: amergnat@baylibre.com
Cc: broonie@kernel.org,
	devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-spi@vger.kernel.org,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org
Subject: Re: [PATCH 2/2] spi: spidev: add new mediatek support
Date: Fri, 20 Jan 2023 09:20:54 +0100
Message-Id: <20230120082054.610626-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230118-mt8365-spi-support-v1-2-842a21e50494@baylibre.com>
References: <20230118-mt8365-spi-support-v1-2-842a21e50494@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_002101_145661_C488659C 
X-CRM114-Status: UNSURE (   9.27  )
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

From: Alexandre Mergnat <amergnat@baylibre.com>

> Add the "mediatek,genio" compatible string to support Mediatek
> SPI controller on the genio boards.

What is the use case of having the spidev? What if I want to
connect a device with a linux driver to it? It seems like you
just want to expose the SPI bus on the pin header. There was a
similar discussion for a mikrobus connector [1].

-michael

[1] https://lore.kernel.org/linux-devicetree/YmFo+EntwxIsco%2Ft@robh.at.kernel.org/

