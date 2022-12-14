Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2164FC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Dec 2022 09:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZeychOEoq7Zx2fAKmiJJqkfIh0+9mZMjXMwWbS//l/Q=; b=HKvpLQ2ixcf4efQz0P/zWJbxkB
	+KZoZsVjnNaHoWLOlTCAOrQXnLD3/U37DxZw++gsN3h/MtQHu0s+eFFcY6Nk0fYZKdztvFmOFCWOe
	MjodNkmRFkvrgDKyDG2AuJRLGvAAmBRI3O1HjgmDixD5ABVLFPdrcPOHNp48evi8nwHL5p9XEx2ZJ
	7mM7iqKnMdV2Utd0U4nGMpms5+qFDFZgpoDuapqjL9ixvHz3pfTBG0ntyS8g7Nl21njM/HO+SqZ+u
	tQwD/BllJBzrTJasXfan7wXNBeNaP+UPdwCUKmwS7ixEPFldP5wlp0c8oV2DjCOhKecwESph80Ca6
	L85GbvcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5Nnd-00EzEu-CC; Wed, 14 Dec 2022 09:11:37 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5NnZ-00Ez6f-RD
	for linux-mediatek@lists.infradead.org; Wed, 14 Dec 2022 09:11:35 +0000
Received: by mail-wm1-x32d.google.com with SMTP id k22-20020a05600c1c9600b003d1ee3a6289so10229797wms.2
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Dec 2022 01:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZeychOEoq7Zx2fAKmiJJqkfIh0+9mZMjXMwWbS//l/Q=;
        b=OXFVZCylX/4bT+jsLBPms7oXz7QPabkjEgubvKA5voELoHfDi00peMTghNLCzd8eaq
         nP2ibgokYJBj2KWiBZjEhKQ+zdmJm+v6RlifmQdsO8suBtWGnxKbf4CZsTyvWffB4Xzk
         CP3ibLqZDT/ds1dpodM9ahZo2PdJUUORzc2JLPe003BODyIMy6Euf0GauL3sERFOo6Tk
         ocbUZXufRgpRSvXRXJdlr5yjxhhP7goz0joVE3Ti48T/ApcY1JbsyFQe1viina/MkBUX
         uu6xSSyMCQBH1l6fEHWCCwz0qhfylUeTZSHlVGhgvKIfvrRA8OZeVMdqZHiZgovSOzJV
         hByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZeychOEoq7Zx2fAKmiJJqkfIh0+9mZMjXMwWbS//l/Q=;
        b=awXj0dXaXVY659lXhZ2JkypT4Pimk8ZzpdDHuEcee2KgnV4cTmI69fwzmT9RuvcxUU
         YYNfyD6rLCSt6A5zR2PIr79ye+yYNcdeiTCLjuE6u2Dn5uwv8HhLBJong+yX0e8BUNqS
         +DJSxwzsuunLwSFBMU8sRbbKCODRtJW1sl25osA/wAMR7wbti+NfrlZyngHYBoBeKsmc
         qSD8/73SswvdVXUnkYXLuZSGfTpGVzNTYAtUDwlyBZ5sB+TT5j4cNfj1M16b+WbTShDU
         t39artNHjIk6qaMV4rPNB7RSaHXyfSZwszHqfkaRHA4o+sxi4V9jIa9TpAWuSM52TSeA
         wa2g==
X-Gm-Message-State: ANoB5pk3E/ELYJVbdKMPs/e1y5t1aC9WJoQhTXADvFme7baSa5HDG21I
	f5eMX4aHuYglxaH5eQuAjQ/koJ3lNSGKeEz9Sj2DmA==
X-Google-Smtp-Source: AA0mqf7lFwCf3f1u4ql2QYub40j2Jn+xpyaWCbFrBIxrz+GPM5OrSo5cjZ+bxnr0nuG4jOrNfiMuxCV5PCxKqjmsLpU=
X-Received: by 2002:a05:600c:3b91:b0:3d0:3d33:a629 with SMTP id
 n17-20020a05600c3b9100b003d03d33a629mr73994wms.126.1671009090250; Wed, 14 Dec
 2022 01:11:30 -0800 (PST)
MIME-Version: 1.0
References: <20221124074725.74325-1-haozhe.chang@mediatek.com>
 <CAMZdPi9JOQpmhQepBMeG5jzncP8t5mp68O2nfSOFUUZ9e_fDsQ@mail.gmail.com> <54c37c8f8eb7f35e4bb983b9104bd232758bae7b.camel@mediatek.com>
In-Reply-To: <54c37c8f8eb7f35e4bb983b9104bd232758bae7b.camel@mediatek.com>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Wed, 14 Dec 2022 10:10:54 +0100
Message-ID: <CAMZdPi8NOfMn99yy043oYGrO1=UrnhhRvpZq-zWe4BfiU_08NA@mail.gmail.com>
Subject: Re: [PATCH v5] wwan: core: Support slicing in port TX flow of WWAN subsystem
To: =?UTF-8?B?SGFvemhlIENoYW5nICjluLjmtanlk7Ip?= <Haozhe.Chang@mediatek.com>
Cc: "stephan@gerhold.net" <stephan@gerhold.net>, "oneukum@suse.com" <oneukum@suse.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"linuxwwan@intel.com" <linuxwwan@intel.com>, "m.chetan.kumar@intel.com" <m.chetan.kumar@intel.com>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	=?UTF-8?B?SHVhIFlhbmcgKOadqOWNjik=?= <Hua.Yang@mediatek.com>, 
	"chiranjeevi.rapolu@linux.intel.com" <chiranjeevi.rapolu@linux.intel.com>, 
	=?UTF-8?B?SGFpanVuIExpdSAo5YiY5rW35YabKQ==?= <haijun.liu@mediatek.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"ryazanov.s.a@gmail.com" <ryazanov.s.a@gmail.com>, "kuba@kernel.org" <kuba@kernel.org>, 
	=?UTF-8?B?WGlheXUgWmhhbmcgKOW8oOWkj+Wuhyk=?= <Xiayu.Zhang@mediatek.com>, 
	"pabeni@redhat.com" <pabeni@redhat.com>, "edumazet@google.com" <edumazet@google.com>, 
	"chandrashekar.devegowda@intel.com" <chandrashekar.devegowda@intel.com>, 
	"johannes@sipsolutions.net" <johannes@sipsolutions.net>, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"shangxiaojing@huawei.com" <shangxiaojing@huawei.com>, 
	=?UTF-8?B?TGFtYmVydCBXYW5nICjnjovkvJ8p?= <Lambert.Wang@mediatek.com>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "davem@davemloft.net" <davem@davemloft.net>, 
	"ricardo.martinez@linux.intel.com" <ricardo.martinez@linux.intel.com>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_011133_915550_31EC6203 
X-CRM114-Status: GOOD (  20.36  )
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

> On Thu, 2022-12-01 at 10:56 +0100, Loic Poulain wrote:
> > On Thu, 24 Nov 2022 at 08:47, <haozhe.chang@mediatek.com> wrote:
> > >
> > > From: haozhe chang <haozhe.chang@mediatek.com>
> > >
> > > wwan_port_fops_write inputs the SKB parameter to the TX callback of
> > > the WWAN device driver. However, the WWAN device (e.g., t7xx) may
> > > have an MTU less than the size of SKB, causing the TX buffer to be
> > > sliced and copied once more in the WWAN device driver.
> > >
> > > This patch implements the slicing in the WWAN subsystem and gives
> > > the WWAN devices driver the option to slice(by frag_len) or not. By
> > > doing so, the additional memory copy is reduced.
> > >
> > > Meanwhile, this patch gives WWAN devices driver the option to
> > > reserve
> > > headroom in fragments for the device-specific metadata.
> > >
> > > Signed-off-by: haozhe chang <haozhe.chang@mediatek.com>
> >
> > Reviewed-by: Loic Poulain <loic.poulain@linaro.org>
>
> I have submitted patch V6 to add a reviewer, do you have any other
> suggestions about the patch?

You normally don't need to resubmit a version just for adding review
tags, as it is well tracked. You can see status of netdev changes from
patchwork:
https://patchwork.kernel.org/project/netdevbpf/list/?series=&submitter=207580&state=*&q=&archive=both&delegate=

Regarding this change you should however resubmit for the net-next
tree with appropriate subject since it is not a bug fix:
https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html?highlight=netdev#how-do-i-indicate-which-tree-net-vs-net-next-my-patch-should-be-in

Then it should be picked by netdev maintainer(s). But note that we're
currently in the Linux 6.2 merge window, so merging for net-next can
be delayed until the mainline merge window is closed (and net-next
open):
https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html?highlight=netdev#how-often-do-changes-from-these-trees-make-it-to-the-mainline-linus-tree

Regards,
Loic

