Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E4AC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 08:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=whTxcEdpaCjrcDv7NOti0yNveH131HYF3ek92hYf4Sg=; b=AgjiH6OtX2XYJG
	XjnqIXJShz0m7zpRbYcsBfZHMOnABvkxGLfTZHjJgwZOc+W2BIsv+lUR/0xNDSElFL5yMhxODklCS
	xyaecSIu+38u8FLXcBTo239Md/IX7nJ0Hc4mNHfY36QzadejP0HpHc1bOn7PnQwDmdVQzTvBailhn
	QFnzrtllSWr6MuPEfNdhXk/FkAnTtEduCrfxE+2ITc1jbREwhNZntKO7SF4aatj/pUpb/gOR1kIYZ
	f0WV+AVOr3TR5+LJgro18dfzcUabwKvZzlEUWJGaBsGy4F1PUWJmWrJvL1sWHJK1RfLZaye2b885u
	c/oEm9FBPV0j2jiXHDfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZ7HR-00BThx-9p; Tue, 29 Mar 2022 08:32:45 +0000
Received: from new2-smtp.messagingengine.com ([66.111.4.224])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ7HC-00BTbe-J0; Tue, 29 Mar 2022 08:32:32 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id C8AFC580117;
 Tue, 29 Mar 2022 04:32:25 -0400 (EDT)
Received: from imap49 ([10.202.2.99])
 by compute5.internal (MEProxy); Tue, 29 Mar 2022 04:32:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=g+MRVCTHkd5UITx1/MCA0rtdiS/Q7gdlkLwbx1
 Cvlxo=; b=UCo5xVnvSc2K5kqHRzTJYLeCTDsbjgl6xT1NBykQQVKMp4Ur92CcFO
 AVM/JayZKVAC/L65NLtrgIbuEHLVwP1Co3xz7FvhPeYlG1Aa5OHK5Qzj2LLMcBlE
 WDtU+9q9xR4065u7bzMG2cnDmDNge9YR3DUCJyjxKPy6ijNuBxr2WhIiWtmAFGLx
 CaVwyLl64hj1MiG3Uig1TLYu4vrIGHosrlS82ja6VAHEBoC5JYmZ2CKUWQMpqg+p
 LhX0oBQIe2SVGDKB1tl9YuLNvxELH4cOL2WMDEfBEJeyYF2z/QfC0sM0WfFEA9jv
 yiENlM4gRwAggRNn+gcXyaRjlMVLYwRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=g+MRVCTHkd5UITx1/
 MCA0rtdiS/Q7gdlkLwbx1Cvlxo=; b=JQKycoTgRna0MzP3EC2Bm6lralytF7Tvt
 lO0V5VJRByINopZ+fWpwTMDpmc9b/kA60ODT10jjyv7RLyd3OIx56kYmaRKvKXC+
 9qywkBjHLtg84fuHVkJ82sdvyWSVvO7j8dRzTPrBA5cWRk2mWM6v+O/RybVFk6XN
 1317aXIiz7LSlCY9H/UvNDXEnOEWcl2X8I5I9ZMOO6mUX7BmtuqNX/TOlTncnjxM
 vnb/YbOBUfwse4qT7wmShdeh7Zr9gvKg4veBUWBzDumgWjl4uoEolDtlj0LQms3L
 KmnJxQzF1LHoY56R0OmEIx4KCtCggE0RHmifBELWQFRqbXe/dRoUQ==
X-ME-Sender: <xms:GMRCYi9lAlRf_jy7QNeRahO_YXR-VhpiMkQ_YloAqeAlNIQCJYksiQ>
 <xme:GMRCYitrNz2rRmWvgRBDL9li4UdVscERnbnixCB8cuM7YHtD6CAt27u0YdYH6glcG
 xVRD9PHWS3Uu0dLBA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehledgtddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:GMRCYoCb5efEYVXCkjDv6RMqt50vpeN1UgDVvgcJYHA7Q7yrh-bcyw>
 <xmx:GMRCYqehW6WYsT5oizMPuHR-1iStUAS0tj_iRWm6Rvh2pxQnybYqzA>
 <xmx:GMRCYnOid8_hb9g4tQfGh5YCQefCRBpCLNIYlNoVWZYfWgt5M14Cig>
 <xmx:GcRCYhUHyBdj-xhT55yXBJuRVssviSpjCt6GNkSVx49WFreCEk1xiw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 599DFF6043F; Tue, 29 Mar 2022 04:32:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4911-g925b585eab-fm-20220323.003-g925b585e
Mime-Version: 1.0
Message-Id: <a2542d9f-581a-49be-8e70-722fd98ab6f1@www.fastmail.com>
In-Reply-To: <YkK691VG6ON/6Ysn@atomide.com>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <CAFr9PXkgrRe-=E=GhNnZ4w1x_FMb97-_RmX6ND1vEd74_TbZSw@mail.gmail.com>
 <YkK691VG6ON/6Ysn@atomide.com>
Date: Tue, 29 Mar 2022 19:02:04 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Tony Lindgren" <tony@atomide.com>, "Daniel Palmer" <daniel@0x0f.com>
Cc: "Ansuel Smith" <ansuelsmth@gmail.com>, "Rob Herring" <robh+dt@kernel.org>, 
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-actions@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@axis.com, linux-aspeed@lists.ozlabs.org,
 linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com,
 linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-tegra@vger.kernel.org, linux-oxnas@groups.io,
 linux-arm-msm@vger.kernel.org, linux-unisoc@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-realtek-soc@lists.infradead.org
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_013230_879642_C04E8C8C 
X-CRM114-Status: GOOD (  20.00  )
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



On Tue, 29 Mar 2022, at 18:23, Tony Lindgren wrote:
> Hi,
>
> * Daniel Palmer <daniel@0x0f.com> [220328 08:53]:
>> Hi Ansuel
>> 
>> On Mon, 28 Mar 2022 at 09:09, Ansuel Smith <ansuelsmth@gmail.com> wrote:
>> >
>> > Hi,
>> > as the title say, the intention of this ""series"" is to finally categorize
>> > the ARM dts directory in subdirectory for each oem.
>> 
>> While I agree with this change and think it's for the good (browsing
>> the ARM dts directory at the moment is frustrating..) I think
>> buildroot and others need to be told about this as it'll potentially
>> break their kernel build scripting for ARM and probably messes up the
>> configs they have for existing boards.
>
> Yeah.. And ideally this would be done in smaller steps as these will
> conflict with all the other pending patches.
>
> For example, I have a pile of pending omap clock clean-up dts patches
> posted and tested waiting for v5.19-rc1 to apply. I'd rather not start
> redoing or fixing up the patches with sed :)
>
> What I'd like to have see is that at some point when suitable we move
> one machine at a time with a script if possible.. Maybe the dtb files
> generated would need to remain in the current directory until all of
> the machine dts files are moved? That should help with the build
> scripting too probably :)

There's probably some reason not to, but could we symlink the new paths 
in the subdirectories to the existing files to handle the transition? 
Then do the move to remove the symlinks at some future point.

Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
