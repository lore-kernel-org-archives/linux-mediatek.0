Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A62FEB64D9
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jun 2023 08:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AzTMO0Jq5VSMjchMTioePBEl7oFeBEDiG3vGcCA7hR8=; b=Ic0SWhEvsK1rAD91EfJ7AlKmvz
	hwBaodq1CcC5N0ExUGVsp/OWzr6xG9dNMm85m85XMNVslxKaSdTOejnXfzzp0xi5q0LRLBn+TLnbx
	+69H2I5QUZLeAJHqTJVv74JNFqTeU3OokKrQSy2uLK3WrNTq8IkjGOz4s9sxLRM3DrV0M9oZyTIyh
	6t0R4Mp/TNYcSNR82c8N3DilGZutQwbaFVIDaPv0CaVUJ6U5TlZNLAZUV/p+E6iJY4iUL8Zng7DxR
	o0sGJMBYac9kxriGGPwnzam+oXQkXmFTXX5lvvw1RTBM0TLabzU8l+2W88OlfucSMN3Gz2vafNCQB
	PtqzrTIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEnCL-000Qo0-0L;
	Thu, 29 Jun 2023 08:40:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEnCH-000Qml-16;
	Thu, 29 Jun 2023 08:40:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A02B9614D8;
	Thu, 29 Jun 2023 08:40:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AABC2C433C0;
	Thu, 29 Jun 2023 08:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1688028012;
	bh=AIUH8mRUplcQ3HfuP4DceQUR2BEXzAOyNoGosEpG0PU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=x4n3wIhUv1ByMeGcPTOb6H9n7hguZqKF7JqlsTu8Kg7cxVmSt3uqLHrMOL3f6JNq2
	 igHDe3mCw9jYTQayUmatdyXMcN96+kzmaN0GdCMnDYxtrF4SKkuK7z1W3zqKeDYsm7
	 bUTR2ZXy5uSbhbJ1B5xthmN01KXdYU3Vs+2ykXdY=
Date: Thu, 29 Jun 2023 10:40:09 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Zubin Mithra <zsm@chromium.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: xhci-mtk: set the dma max_seg_size
Message-ID: <2023062942-thumb-giddily-f0e0@gregkh>
References: <20230628-mtk-usb-v1-1-3c5b2ea3d6b9@chromium.org>
 <CANiDSCsAgD33gMk9-CTGHuUv_b4KfRnO02ETEt6jFtQvw+6cag@mail.gmail.com>
 <ZJystxdl0jVoe5b6@google.com>
 <CANiDSCu3WOqK9wdLDXmW+zbckq15gmxKjtFA4Aghv6uoidO_3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCu3WOqK9wdLDXmW+zbckq15gmxKjtFA4Aghv6uoidO_3Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_014013_428858_6D4B2351 
X-CRM114-Status: GOOD (  13.27  )
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

On Thu, Jun 29, 2023 at 09:13:23AM +0200, Ricardo Ribalda wrote:
> Hi Zubin
> 
> On Wed, 28 Jun 2023 at 23:57, Zubin Mithra <zsm@chromium.org> wrote:
> >
> > On Wed, Jun 28, 2023 at 11:04:20PM +0200, Ricardo Ribalda wrote:
> > > On Wed, 28 Jun 2023 at 23:00, Ricardo Ribalda <ribalda@chromium.org> wrote:
> > > >
> > > > Allow devices to have dma operations beyond 64K, and avoid warnings such
> > > > as:
> > > >
> > > > DMA-API: xhci-mtk 11200000.usb: mapping sg segment longer than device claims to support [len=98304] [max=65536]
> > > >
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > Reported-by: Zubin Mithra <zsm@chromium.org>
> >
> > Should this be cc'd to stable@ as well?
> 
> Not sure, in most of the cases this is "just" a warning fix. Let the
> maintainer decide:

Warnings can cause reboots as the majority of the linux systems in the
world run panic-on-warn, so yes, it should be backported.

thanks,

greg k-h

