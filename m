Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE37DECAAD5
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Sep 2022 14:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aZ+oBpeo8JsuvtNdwggGcqsSE9afnliueCxoJZqBN7U=; b=RpHpMpULyETxfHg3+HVmvNvK6C
	qFuG8FvZR7s4Iy8qWTi8h4KC0Umsz2pIYL8/t5rGa3Hh8p96Ga/1v9p0fHJD1a/fr5duiwr6mgzYW
	179JTPB7Kvl7rKt7i4zOe5TaqrgbPJ/aj4yKNe8/U/VhGUX+Kw3qx/utyuQ/A1WrX5YA7tSd0W792
	dS9IomHBNEo6hNfWEw7qrqIFY4E54+0WEQ/sdKbWK0xqp1/raOg9r13im6xqGIr5bJSl/HGSqR+40
	+SO8jbLcE59nD9bT/y2ZEjiQYGuoNrfImfnTQVqgrmKfxEG1bKi0HUDVo/MEA2UvjfLl9FCHv8y3x
	qPw/3uXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU80m-005nCy-Co; Fri, 02 Sep 2022 14:51:12 +0000
Received: from zeniv.linux.org.uk ([2a03:a000:7:0:5054:ff:fe1c:15ff])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU7zc-005mPw-30; Fri, 02 Sep 2022 14:50:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=aZ+oBpeo8JsuvtNdwggGcqsSE9afnliueCxoJZqBN7U=; b=RAadmeaUeYbulm9czRnwLyIs2I
	WGb29yXZX4DZLJGpVl2nRhLsckXMLIiJSJVrV6LFl8X+wPJuomJYZh1vQggraP9Pdnhv/gGikP9Qu
	th93zu2WpmdgXVac6wraItw1t1YbqW67M1jYL6VtttTEynEM/urS1xL7pSpQMAmKGMg9Iq//2Ggcq
	P1w0VkeNNhKdGxuOVfjUmje02hm0DZPe3MHA6LEi4L94zZuNE7sFbdwjoT9d4oHoLNJYGTmYKucF1
	Vy1wm7IRZ1IdAVc1VgIHfAJqFW2dcQV7w2VzMj3Y5UCeoGZSdlw5jrpv1pvVp53LTEpSQ6l/LSVyC
	+Bp2YXWw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.95 #2 (Red Hat Linux))
	id 1oU7z5-00BMvU-LF;
	Fri, 02 Sep 2022 14:49:27 +0000
Date: Fri, 2 Sep 2022 15:49:27 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kuyo Chang <kuyo.chang@mediatek.com>, major.chen@samsung.com,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Daniel Bristot de Oliveira <bristot@redhat.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	wsd_upstream@mediatek.com, hongfei.tang@samsung.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/1] sched/debug: fix dentry leak in
 update_sched_domain_debugfs
Message-ID: <YxIX96nUnwz56fte@ZenIV>
References: <20220902031518.1116-1-kuyo.chang@mediatek.com>
 <YxGUBzp9C7kcNgps@kroah.com>
 <5ce45c874d6a05ca69abed3961d413c4a4360e79.camel@mediatek.com>
 <YxGpp/+lWSzwpVLZ@kroah.com>
 <f14e71182ebf1520aeede06afb44af49ec6128a0.camel@mediatek.com>
 <YxHI2sRgF2gqYcHk@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YxHI2sRgF2gqYcHk@kroah.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_075000_145427_84EEED9B 
X-CRM114-Status: GOOD (  14.54  )
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

On Fri, Sep 02, 2022 at 11:11:54AM +0200, Greg Kroah-Hartman wrote:

> +/**
> + * debugfs_lookup_and_remove - lookup a directory or file and recursively remove it
> + * @name: a pointer to a string containing the name of the item to look up.
> + * @parent: a pointer to the parent dentry of the item.
> + *
> + * This is the equlivant of doing something like
> + * debugfs_remove(debugfs_lookup(..)) but with the proper reference counting
> + * handled for the directory being looked up.
> + */
> +void debugfs_lookup_and_remove(const char *name, struct dentry *parent)
> +{
> +	struct dentry *dentry;
> +
> +	dentry = debugfs_lookup(name, parent);
> +	if (IS_ERR_OR_NULL(dentry))
> +		return;

	Could somebody explain how could that return ERR_PTR()?

Incidentally, IS_ERR_OR_NULL is almost always a sign of bad interface - or
that of lazy cargo-culting.  Please, don't propagate that garbage... ;-/

