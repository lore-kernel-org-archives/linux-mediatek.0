Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BCCC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 15:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jIwUBbVdQ9LS6OHbzsc5fCzKF4YEHQ6g8JCjqXsU3WE=; b=ZuMa7uIB840MnahK8ZYEEI6vCz
	oJ5mhG4cKN8TtmV4CoYekI9dfxgezkAWgmw4xVkDle4TN4A/NkVfxQ15P7NZs9304kbqmrqRaICgt
	vGKaS8UNdFl1wwh8JXofn7sLHH8FhjCZrepT4RzOpgbdCIQuRoOVgUM/1FlDMG37lrNrFpQEJzIPH
	7GEszye9C7rHvOmjN7AdP93TMmTWAnWX2eG55Rrgp+kVKGqZATiZ/aMPVtIjbjFj7ZnYfLxGj/t3+
	F0KCiZdrcrdjof7X0XGYOvWsPDoscNPJA+IJ2ysaLyO0ynoAZ0Z6Is9f4RanPTXrS8cYdO1qocdPY
	rf8QgAmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox8bg-00F6zT-06; Mon, 21 Nov 2022 15:21:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox8GZ-00EwFW-Pv; Mon, 21 Nov 2022 14:59:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669042763; x=1700578763;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Bg7fc0fdg0hllLzTvAl2qNMGHQGaUp8kFauzj5L30A8=;
  b=TjnMgcaX4dv7oplTYC0Ou0YI8e9axbQ0Q2MOz5XcdA4qGUOSQzcFTIAm
   SKotH6rMc2hIzGnhW/Z6ocVpkSE1wo5ArLUQVdY+6gTBYEEAl7nZKW0jX
   /+gqgvnyCINRXrBP4xX5zFFG9qJz9DQNtkp9+0DNoGLJl3OXAbXRSFa0H
   /p7MGTgWHxGEWzBB2XvIrYRa2KH6SHv2xwfL9GbL/7k+kAu4GQYyPEQEt
   ur5uGNHnjjORpMFyrTRho2Oz7ctUlQD9xlh+Npv/LD6MrQYfjPcThDVJm
   S2srL6BH+zg8BkHxCVHhPXxaMpxP3R7MWsx1pv0lrR/hfoZg+zTC2RCGN
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; 
   d="scan'208";a="124407130"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Nov 2022 07:59:15 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 21 Nov 2022 07:59:08 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Mon, 21 Nov 2022 07:59:05 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <richard@nod.at>, <matthias.bgg@gmail.com>,
	<linux-mtd@lists.infradead.org>, <miquel.raynal@bootlin.com>,
	<pratyush@kernel.org>, <allen-kh.cheng@mediatek.com>, <vigneshr@ti.com>,
	<michael@walle.cc>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>,
	<linux-mediatek@lists.infradead.org>, <linux-spi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <bayi.cheng@mediatek.com>
Subject: Re: [PATCH] mtd: spi-nor: Fix the number of bytes for the dummy cycles
Date: Mon, 21 Nov 2022 16:59:04 +0200
Message-ID: <166904273877.104708.18259766810338058949.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221031124633.13189-1-allen-kh.cheng@mediatek.com>
References: <20221031124633.13189-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_065923_992843_F0E084AD 
X-CRM114-Status: UNSURE (   8.53  )
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

On Mon, 31 Oct 2022 20:46:33 +0800, Allen-KH Cheng wrote:
> The number of bytes used by spi_nor_spimem_check_readop() may be
> incorrect for the dummy cycles. Since nor->read_dummy is not initialized
> before spi_nor_spimem_adjust_hwcaps().
> 
> We use both mode and wait state clock cycles instead of nor->read_dummy.
> 
> 
> [...]

Applied to spi-nor/next, thanks!

[1/1] mtd: spi-nor: Fix the number of bytes for the dummy cycles
      https://git.kernel.org/mtd/c/fdc20370d93e

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

