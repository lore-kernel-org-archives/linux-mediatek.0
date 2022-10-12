Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A32C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Oct 2022 05:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ixm4U5sGt2GHezIxBRF6blUeRWJjsCpZMyffwhi3dhs=; b=LA/sslL4+XZr1a9Dyo2aPWobht
	tZq7Y/L8uyaTSGsVNkJNfPeo6j9iX97yQreOgaNezLmXXKATpuJyU1ODZFSlpU0k13SIiTjABuIbu
	R0IziVkXcbFIPn4XodNwh1G804q7hryA42UJJI8TAns6tLV6Te1GZLM3x8IoIgsaxygB+WhXLqUNk
	8HTsw3ZGJauPYkl7ZEkoBOy1MlsUqH1OLjKVfFTKgAWV30N+QorppDYwPGu+Xx2zfPvDqKc3oC52o
	lGHMjOFS5IUNgRf/O9urByhv5j8vWM632HkwpDjf94d0SqaGj4SaQE5WGCEqkCbZI+gYX/l+73gTi
	IlxtKkEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiUWG-006t73-N5; Wed, 12 Oct 2022 05:43:04 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiUWE-006t6Q-5v
	for linux-mediatek@lists.infradead.org; Wed, 12 Oct 2022 05:43:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CD50BB8168A;
	Wed, 12 Oct 2022 05:42:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4812C433C1;
	Wed, 12 Oct 2022 05:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665553378;
	bh=UD98M449mjm3XrhO6K5pfGmwoVOkbmcwneMWsKdWneg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=IajkvWz6wLode6De8UYaVNcgA5dI0OPPVF2TWlKqLv51G90GHgI6k17f6C5EATBEW
	 uOZK2H8fAxkzdIr6xcirWsPx+g3idn3sMvByl7qaHJNOV2n0ddDVpKVg//1K5jm3I+
	 tUNWyuiaS+iKQ6tkJx5+6LI89SzIvaL9GiI9hY/QS0oEtINd1R/IzAx+Yq4sXj2vlV
	 5wxPKYS9yzRciYdjCp9Ue0ff8o1IVWNLgMYqz2wPTuN44D0IE6yXgvdWXvaIBgHG/B
	 kD3SWqix1RDb++Nb/kZ9+2OuMlih7+hN6mvGGYGZT38KFj0B2N3AqTf1b44A+BD2kS
	 mvNQAHwLWFGOw==
From: Kalle Valo <kvalo@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: nbd@nbd.name,  lorenzo.bianconi@redhat.com,  Bo.Jiao@mediatek.com,  sujuan.chen@mediatek.com,  ryder.Lee@mediatek.com,  evelyn.tsai@mediatek.com,  daniel@makrotopia.org,  linux-wireless@vger.kernel.org,  linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/3] wifi: mt76: introduce WED TX support for mt7986 SoC
References: <cover.1664356281.git.lorenzo@kernel.org>
Date: Wed, 12 Oct 2022 08:42:51 +0300
In-Reply-To: <cover.1664356281.git.lorenzo@kernel.org> (Lorenzo Bianconi's
	message of "Wed, 28 Sep 2022 11:19:40 +0200")
Message-ID: <87r0zd4mxw.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_224302_400844_CE7E863F 
X-CRM114-Status: UNSURE (   7.18  )
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

Lorenzo Bianconi <lorenzo@kernel.org> writes:

> Enable WED TX support for mt7915 and mt7986-wmac drivers running on MT7986 SoC.

What's WED TX?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

