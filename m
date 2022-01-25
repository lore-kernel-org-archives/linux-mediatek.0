Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17373C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jan 2022 01:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cpiFsXaXysO1GFp1/l94n6mPNE1fSnQkZ0hP8DjIQZY=; b=ntkOSfmpy4fj80
	KESgPDgJ7HqEK6LTE3ufeLsdUs2JOkn1n4Evq1mznBpLA98WeCwn4kLXG1cfmB1L7iE3AxA4Czk6l
	CF5F5e1Y0REjftlOLfofiaLyZRfqNkuojyYNw6yRrNiZ+6HUNVgJ8+LkQC162W5bWt1W+c0TTa8M0
	qksUp30lvm+sJydhiFrs1qd3Am3TlvHln5D8MrQDWF2P1Q5jOrheimWyYdV8z6KJFRImPj4aoOE2x
	waDasGd66xt6rH8Y8IKdOqpx5p1bJ3LZ/reNoj9Vwx+NKp6QlfQHR7lcvNF14OWY8IUSb7cortwZG
	xAxyqMZflEWwqe55NxLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCAZR-0061pN-HR; Tue, 25 Jan 2022 01:24:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCAU4-005zpe-Dv; Tue, 25 Jan 2022 01:18:58 +0000
X-UUID: dfee463f51bd4f85ab267af83a3c4fca-20220124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=TEsEPwXlzj8U3UJ7jgrFJDbrYwE3tQjypPRbDgLCkL4=; 
 b=ucQm7+cJjXmG7ZBicOu7E6zpRdaJ0PqlarGvX99AgqMFj1pHPw2xkP+M3/o/Ug1V1AxHCMV+yL18gWR+t3OPYh2USJwylYeQKjh6NRExGjuVdAMcx9vNhzO1HodOOKeuDnRDzhp5LrAeJ3G1sc8S4I+pMqBIQML1YjoIVhiGDW8=;
X-UUID: dfee463f51bd4f85ab267af83a3c4fca-20220124
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 357632453; Mon, 24 Jan 2022 18:18:55 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 24 Jan 2022 17:18:53 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 25 Jan 2022 09:18:52 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 25 Jan 2022 09:18:51 +0800
Message-ID: <184823d40e24166246b2be1fc823a18d413e341d.camel@mediatek.com>
Subject: Re: [PATCH V3 1/2] dt-bindings: spi: Convert spi-mt65xx to json-schema
From: Leilk Liu <leilk.liu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date: Tue, 25 Jan 2022 09:18:51 +0800
In-Reply-To: <Ye6nQIVoti5TKh+k@sirena.org.uk>
References: <20220124061238.7854-1-leilk.liu@mediatek.com>
 <20220124061238.7854-2-leilk.liu@mediatek.com>
 <Ye6nQIVoti5TKh+k@sirena.org.uk>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_171856_519621_B2696CC3 
X-CRM114-Status: GOOD (  13.95  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2022-01-24 at 13:18 +0000, Mark Brown wrote:
> On Mon, Jan 24, 2022 at 02:12:37PM +0800, Leilk Liu wrote:
> > Convert Mediatek ARM SOC's SPI Master controller binding
> > to json-schema format.
> 
> Please make any YAML conversion patches the last patches in a series
> -
> there's frequently a backlog in reviewing them so having the DT
> binding
> patches first blocks any progress on everything else in the series.

OK, I mistake to lost " dt-bindings: spi: Convert spi-slave-mt27xx to
json-schema" on V3 series, I'll send it again, thanks

> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
