Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF535C0015E
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jul 2023 06:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YGUYq/imr0mSwlMAKUa8AVW3pLd0RBUAyRIHTklOP0A=; b=1YhaZ0g1w/Ne6fzEPmI2t5NjDw
	bsxPKSOUFkA28ubTl0oL8IHXxHKEAsz64aVLmtdcpCBameDIrFZwmAwmSuQWQt4OmhE6ocHxw3T6v
	+p/L+XRc30PlQ5zl0N8TVYh4tSGtoJd+ALTwcm+sX9j3o9oLIcKHOdKDTBRkny1kzIp9JvFL4pnrC
	9sKtfrz9Fl/9ggYyeDpj+87/5sK2oV7t1KpGWoNKGw1Jp7KTCXghwhb7ssXJaWZG7QkCYR3mqNmRa
	7rvd9TBp1oXD4qKPP2Vhg20Vx3wpQm4mDSCHeNu6T8TICzOYRy2XaoEunxU/FOIG6RZDRKg1OtsxP
	VWv9AUjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOuRh-00CJY3-08;
	Thu, 27 Jul 2023 06:25:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOuRf-00CJXh-02
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Jul 2023 06:25:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4F5E061D22;
	Thu, 27 Jul 2023 06:25:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63461C433C8;
	Thu, 27 Jul 2023 06:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690439153;
	bh=03DTX74J6VXxZp4+jEQ2csehpY497pC49E52qsgVptY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=gc3X8jtjqy0JIJq+iKyDQ2NqmzXwlht3bLGzl1V48NeV3/1xjicxLOytRITd+QaUd
	 C1HRF9uhEPDlLXX8P5JdQ1bWJSAXDCjFDjgoaRZT0TVOxYUWmSmC4k7CRuaYLpXFsW
	 HF4u5Pm+3RNHdke6yCcZSYli/wKrEUJ8z3A9vNkl3O7aVtBD4kGOxIfvPaCPMZGimC
	 zNUHlKx1FrAJxmEUY57YHxymfEA0QavLmuViA5/z4nOBC0kG1peU3cPjtmp43fbzE0
	 +F2XlRkRk3H5AKV4XGCTkjHeBFB5hw+MSmBBF/RMF/MFgt9VSIOBh6+J2KBIfy+kCe
	 e/rTx4xkpPlUA==
From: Kalle Valo <kvalo@kernel.org>
To: David Ruth <druth@chromium.org>
Cc: sean.wang@mediatek.com,  nbd@nbd.name,  lorenzo.bianconi@redhat.com,
  Soul.Huang@mediatek.com,  Leon.Yen@mediatek.com,
  Eric-SY.Chang@mediatek.com,  Deren.Wu@mediatek.com,  km.lin@mediatek.com,
  jenhao.yang@mediatek.com,  robin.chiu@mediatek.com,
  Eddie.Chen@mediatek.com,  ch.yeh@mediatek.com,  ted.huang@mediatek.com,
  Stella.Chang@mediatek.com,  Tom.Chou@mediatek.com,  jsiuda@google.com,
  arowa@google.org,  frankgor@google.com,  kuabhs@google.com,
  abhishekpandit@google.com,  shawnku@google.com,
  linux-wireless@vger.kernel.org,  linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] wifi: mt76: mt7921: fix the wrong rate pickup for
 the chanctx driver
References: <8fd42ac8e1c97246f6e65225a14fc8a029ac3aaa.1690232804.git.objelf@gmail.com>
	<7c7c2c1f0584e8dd016bc2bf8de88684fcc7679c.1690232804.git.objelf@gmail.com>
	<CAKHmtrQVp9yV1uFagENxW1ra3sVCf-9WP4thpQ97runk3PaXKA@mail.gmail.com>
Date: Thu, 27 Jul 2023 09:25:58 +0300
In-Reply-To: <CAKHmtrQVp9yV1uFagENxW1ra3sVCf-9WP4thpQ97runk3PaXKA@mail.gmail.com>
	(David Ruth's message of "Wed, 26 Jul 2023 23:43:55 -0400")
Message-ID: <87v8e5zx8p.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_232555_115907_A7A96DD4 
X-CRM114-Status: UNSURE (   7.01  )
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

David Ruth <druth@chromium.org> writes:

> Reviewed-by: David Ruth <druth@chromium.org>
> Tested-by: David Ruth <druth@chromium.org>

Please don't top post and edit your quotes, otherwise use of patchwork
becomes horrible for us maintainers.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

