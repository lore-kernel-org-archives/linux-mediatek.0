Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08A5D1AD29
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 08:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hbBgQvKo5TFwgjN0HW1u3d4B3dWQUCfFxbUt5wlQRzw=; b=DU7H+EPIQ58PDKnCDXXv/RjpDQ
	dwD4X5hhcPoCGLEIdLVH/I6qI3PZ3bUF1WPZtuzFVTmWdrU4jYhbRkp1SU76MJuKkjCLI6gdZDYCp
	Bt+nvyrYQTU5FDPV8gObZ3yuU1epTzAy3zNhuRgJy+jdWCcCalocVGy3UJlcATyL4Z3LJBazixWim
	Fa5svAhMOeKT/NfZvDW0yiKj/mCdB4s2k/P87syVtEL5PWcaofYjVRInNI4jqQXxDbH4pplK/brsg
	fu30BFKOFqWT/Q0uRJRx0cRaE/UkkS0DEYnKOzHVOnA76+sBUdZpkPbDKxqYzO8qpkXTG0RKMN/SE
	sWS/dmyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0zGv-0000000B08P-3Xkd;
	Wed, 16 Oct 2024 08:20:45 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0z1Z-0000000AwVw-2adm;
	Wed, 16 Oct 2024 08:04:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D3F68A4392B;
	Wed, 16 Oct 2024 08:04:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EF18C4CEC5;
	Wed, 16 Oct 2024 08:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729065892;
	bh=v+qBEppypquywLvv4BUQnhRMQDDzEWPKeUkhrBX+4uI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SW/QIACp+Dz1pDNpAGxWc6any/7DwZYe82WfXw3koGwt4aq6ftY97vPQLPzot5bxg
	 J2OFUsj1K6laUN8TRK4bhpj74DioBce0LqfHKw1DH0v1RAkOg4H3zc5G7VfNI9z4yl
	 TArCuhVgXPlTQkAPulTV5jbpQ5z3pdBPIdiHNbCbblq1kN2F1drEc7eBDrVjfUh+V3
	 I0yxY/NCet3q6E9QMmdbmo02iZIWGx4OTfUrsx7KFPeNmAsG2Qpkd736B5zf1Kkfja
	 x5u/mG5EXpVO98ORGLEIQldLgu+3//7xQFoYiPmSMVZWyOx0YgPQEqpnoPYcdxgS4x
	 1GyN3zmI+PKkg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, eddie.huang@mediatek.com, sean.wang@mediatek.com, 
 alexandre.belloni@bootlin.com, sen.chu@mediatek.com, 
 macpaul.lin@mediatek.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org, 
 kernel@collabora.com
In-Reply-To: <20240923100010.97470-2-angelogioacchino.delregno@collabora.com>
References: <20240923100010.97470-1-angelogioacchino.delregno@collabora.com>
 <20240923100010.97470-2-angelogioacchino.delregno@collabora.com>
Subject: Re: (subset) [PATCH v1 1/3] dt-bindings: mfd: mediatek: mt6397:
 Add start-year property to RTC
Message-Id: <172906588925.1150194.7403716140850738159.b4-ty@kernel.org>
Date: Wed, 16 Oct 2024 09:04:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_010453_744640_6CF786D8 
X-CRM114-Status: UNSURE (   5.50  )
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

On Mon, 23 Sep 2024 12:00:08 +0200, AngeloGioacchino Del Regno wrote:
> Enable evaluating the start-year property to allow shifting the
> RTC's HW range.
> 
> 

Applied, thanks!

[1/3] dt-bindings: mfd: mediatek: mt6397: Add start-year property to RTC
      commit: 0a98b711db1345687df995495ee1d097bba5a958

--
Lee Jones [李琼斯]


