Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D4BC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Nov 2022 14:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/RsElrJ4fTpZwQGc5X/fuTrHyuS75pyOL1EdjY8Plxg=; b=y2x7N1uS3tu2UEKmeNQZxnjOIC
	nAadYvVapupPuFbnGu2IVk8qo2/5geOXjwWCMFj6sr8FKFhwmjXZPg4QzXCz7m4ygitmxCSWdSz99
	do1GOmaVC49rXzh/wFM81nD+wnSnqQRzFn8ta1acud8yXBYzDQThShZ0aukdV+7lR6H34JNqJmeT3
	awYeIWfjT9TyZk8K5Eljzz9UZn1tLudAmaXpJh9BOOsz8N0e3XxTUOW0INwuXkaoalBhDAjGiXSEy
	Nf4t39E02RSduph0A1u0PYVzZVuEEiMsA5jiEdQb/5MqB9Z6yL0hvIBIW7cxpvWAHDcRn2Mc0wXNc
	H/cR64+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozehU-0022ji-VY; Mon, 28 Nov 2022 14:01:36 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozehT-0022hi-4c; Mon, 28 Nov 2022 14:01:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=/RsElrJ4fTpZwQGc5X/fuTrHyuS75pyOL1EdjY8Plxg=; b=xY
	R6f5DBIUtCPgDzvdOMVTFzCvO0KVS6tiBc4qDT6PwCyrku33r2WcWfkTQEggH0ZX9v3eH0/8REaSp
	leaw7ev/I/etiU1oFPJGr6nl0ydANI7EKEN//tmCTSWidBJTf4iqh3MXZWcXyjSikAKq9S9tDHAHi
	fh8OnGlFTox4hyA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ozegs-003evG-3k; Mon, 28 Nov 2022 15:00:58 +0100
Date: Mon, 28 Nov 2022 15:00:58 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Chunfeng Yun =?utf-8?B?KOS6keaYpeWzsCk=?= <Chunfeng.Yun@mediatek.com>
Cc: "vkoul@kernel.org" <vkoul@kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"nathan@kernel.org" <nathan@kernel.org>,
	"kishon@ti.com" <kishon@ti.com>,
	Eddie Hung =?utf-8?B?KOa0quato+mRqyk=?= <Eddie.Hung@mediatek.com>,
	Tianping Fang =?utf-8?B?KOaWueWkqeW5syk=?= <Tianping.Fang@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"trix@redhat.com" <trix@redhat.com>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>,
	"ndesaulniers@google.com" <ndesaulniers@google.com>
Subject: Re: [PATCH v4 3/3] phy: mediatek: tphy: add debugfs files
Message-ID: <Y4S/GhUcrxJ9W/gE@lunn.ch>
References: <20221110132716.12294-1-chunfeng.yun@mediatek.com>
 <20221110132716.12294-3-chunfeng.yun@mediatek.com>
 <Y3+uGjpMQcEWQrew@matsya>
 <70407a789b48a4fbd498e392450eb9db76e025bf.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <70407a789b48a4fbd498e392450eb9db76e025bf.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_060135_198927_D4B4616F 
X-CRM114-Status: UNSURE (   7.75  )
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

On Mon, Nov 28, 2022 at 07:26:02AM +0000, Chunfeng Yun (云春峰) wrote:
> On Thu, 2022-11-24 at 23:17 +0530, Vinod Koul wrote:
> > On 10-11-22, 21:27, Chunfeng Yun wrote:
> > > These debugfs files are mainly used to make eye diagram test
> > > easier,
> > > especially helpful to do HQA test for a new IC without efuse
> > > enabled.

Exporting data for eye diagrams seems like something many PHYs could
use. Please consider adding an official uniform API which any PHY
could use, so we don't end up with lots of incompatible formats in
debugfs.

	Andrew

