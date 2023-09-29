Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46342E728DD
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Sep 2023 19:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Date:References:In-Reply-To:Message-Id:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/rnZ43krlTnKGjYuvqhBAItQLnGBofJgdfA6Jy4XxRE=; b=BYfYvTra3oTmkhaLckRUeK8KAq
	T/laIPvv87ZXHJ9zl07YipdbMkJe/ihN4EXsFZDkCnSPGklBdDgwpquISY4cc9j7wGEU+OZonFmrb
	UUXDbfo5RGulNIh3ZHCqKrbYnXjKV0s7d86+h7BXevjhs/+TO7oUD3Ti8ZnmowyUTBvJWu/5Rr/A8
	vwK8HgjhIu8aW4zbo7doV+otimP2JtVRVvV+1hB5y85iBztOMyuWe+40CGcuz0oT+Z2W1DbMNsgcM
	XlAxmViTNOynMahhBKMdvc8uICGvEvfzO2p3l5OMd4grwp6X0/yNRYwcT8D+VLVHFPCIQnsTPIA/3
	A4hZ9Dqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmJIt-008V1B-01;
	Fri, 29 Sep 2023 19:37:35 +0000
Received: from wout4-smtp.messagingengine.com ([64.147.123.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmJIn-008V0a-2a
	for linux-mediatek@lists.infradead.org;
	Fri, 29 Sep 2023 19:37:33 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id B55F5320030E;
	Fri, 29 Sep 2023 15:37:22 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 29 Sep 2023 15:37:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1696016242; x=1696102642; bh=/r
	nZ43krlTnKGjYuvqhBAItQLnGBofJgdfA6Jy4XxRE=; b=ZXTRiFHeE8YsIOex3R
	ikNNS92U0h8K+/2JL0C7JTwZ+VWBkEbcGdCwCMcY+Ul1anNIvmTYBjqu5g5neLMT
	M6iD/AdbrWVKtiBTCJbbJwlbWKN4rfV+nl+uatQpzy6uljYXQkwi7FUCFlP6bGOa
	U7Q8oHWNTsOSMqrqBFnuV0JW2r168jjjDKY1VsVrhrLuenz+ZYZxD5w7UwmIqO7k
	aN6a1MmX76TbzlZuo8CIiYMhzs7OMEtep2vjIq0cFh9t9dgEUYUvsxTfB+EE2n0u
	2gyqdX/WWbW8XTRtzx0SE+837OtUJfgmDEQDIt6LVv5FZIJrlw69JmLPWi0Ve3Sd
	HafQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1696016242; x=1696102642; bh=/rnZ43krlTnKG
	jYuvqhBAItQLnGBofJgdfA6Jy4XxRE=; b=FTye3nUqUs9CxedjMOCorVMmR9bv+
	6NpUjHhhBJZFlQcyKm0d5rMpsO+YximgVZHVzND9IWPIk54GOvTxemhM6+xJsMJy
	9ZZP8bfT9SSNH2Bup/9TwuJdn4BTWAoQCA0/FdmrNfPHuQXH6rq/OviO22jz/GLZ
	Fqotv7E+hCszhRCgR1dO/M8/sIXOPRFLuQoa6xXivZdodGzBL3ID32AnF0eoJUMB
	SDOWiyjjjIcK7dn22mMQe6M2n+YLlpJwTWZTEtBvpT8zes6Z/jKSeH5uPZjWFQGx
	CAQ8nw0HAfFyWEy4KYfyocAR+BV41+uPuXE5vZjErMeKyDO8QAE8CT4Dg==
X-ME-Sender: <xms:cScXZegZSCNhyuxyl7xPChMRzWBjwY-T_BDIVczrpv9RUpQqOQ9SCA>
    <xme:cScXZfCTzyb3VjRVQSOsRu1hUClW6u3Wt7GN-FrPCaaSCbEdNp5J02MlqzUq8gytg
    BSUeXDbCiBAbqGucSg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrtddvgddufeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepvefhffeltdegheeffffhtdegvdehjedtgfekueevgfduffettedtkeekueef
    hedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:cScXZWH1633Ct5-DhBZIcAiu3p4yFW0TcsGGOB6I5l8NkP8MLjWLCg>
    <xmx:cScXZXQMPDSDPs9bO9xJQW3Jot5cRpgR1qWcuJDiIu5nzel7SQvfNw>
    <xmx:cScXZbxJ9X_ev-B51klxQlO4vYKI3Rg4j_8hACJawrcvKLufgj4l6A>
    <xmx:cicXZSnJD-4qY4ueVe43ZXE0e4ParBgTew_zKmlNPZxaU6NxztYz2w>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B231AB60089; Fri, 29 Sep 2023 15:37:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-958-g1b1b911df8-fm-20230927.002-g1b1b911d
MIME-Version: 1.0
Message-Id: <84b2de54-8337-42a3-a25c-a95cf2f3349f@app.fastmail.com>
In-Reply-To: <20230929082009.71843-1-angelogioacchino.delregno@collabora.com>
References: <20230929082009.71843-1-angelogioacchino.delregno@collabora.com>
Date: Fri, 29 Sep 2023 15:36:57 -0400
From: "Arnd Bergmann" <arnd@arndb.de>
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: =?UTF-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>,
 wenst@chromium.org, "Matthias Brugger" <matthias.bgg@gmail.com>,
 "Rob Herring" <robh@kernel.org>, amergnat@baylibre.com,
 "Stephen Rothwell" <sfr@canb.auug.org.au>
Subject: Re: [PATCH] MAINTAINERS: Add Angelo as MediaTek SoC co-maintainer
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_123729_871125_AD1675E4 
X-CRM114-Status: GOOD (  21.71  )
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

On Fri, Sep 29, 2023, at 04:20, AngeloGioacchino Del Regno wrote:
> I am a top reviewer mainly for MediaTek SoC related patches in most
> subsystems and I've also been upstreaming both improvements, fixes
> and new drivers and devicetrees when required.
>
> The MediaTek scene saw a generous increase in number of patches that
> are sent to the lists every week, increasing the amount of required
> efforts to maintain the MTK bits overall, and we will possibly see
> even more of that.
>
> For this reason, and also because of suggestions and encouragement
> coming from the community, I'm stepping up to be a co-maintainer of
> MediaTek SoCs support.
>
> Signed-off-by: AngeloGioacchino Del Regno 
> <angelogioacchino.delregno@collabora.com>
> ---
>
> P.S.: I tried to reach to Matthias for almost two months, but I couldn't
> find any way to talk to him and he has been unresponsive on the mailing
> lists as well.
>
> P.P.S.: This also comes after Rob Herring's suggestion to have myself as
> a MediaTek SoC co-maintainer [1] and support from other people.
>
> [1]: https://lore.kernel.org/all/20230804225813.12493-1-robh@kernel.org/

Thanks for volunteering for this!

I have no information on what Mattias is doing, but I see that he
has not merged any patches since June, and that he never sent a 
pull request for your patches that are still in his for-next
branch.

I hope he's going to be ok, but let's plan for you to take over
for the moment, at least until Matthias is again able to keep
maintaining the platform in the near future.

Here is my suggestion for how to continue from here:

- Please send your MAINTAINERS file update to soc@kernel.org
  along  with any urgent bugfixes you may have, so I can forward
  them for 6.7. I'm wrapping up the current set of fixes at
  the moment, so this would be for next week's rc

- Create a git tree with the ususal branches (drivers, soc, dt,
  fixes, for-next) and ask Stephen Rothwell (on Cc) to add
  the combined for-next branch  to linux-next for integration testing

- Start each branch on 6.6-rc2 (usually we use rc1, but this time
  rc2 is a better candidate because of the last-minute
  drivers/pmdomain rename), and merge the corresponding branches
  from git://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git
  into those to avoids conflicts with his tree

- Add any further patches you want in 6.7 on top

- Send a first set of pull requests to soc@kernel.org for whatever
  you have merged as soon as you are confident about them,
  ideally by the end of next week.

- Send additional pull requests for fixups or late features in
  the weeks after that as you see fit.

See Documentation/process/maintainer-soc.rst for more details
on the above. When Mattias comes back, you can work out a new
process together with him.

       Arnd

