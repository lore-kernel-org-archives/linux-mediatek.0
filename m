Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E5BC04A68
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 18:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=17kigxGvW4oO2tVOPFkWCos9YzmgV9xkKWZ4CGN+uQ8=; b=mBGbFVy5TbLd93FjlwLLJaViB5
	Wfoqio7oJmaPmsUNKRg3CUsr5yyQMENcHV3KFe2Aq/HsmkQBVXSucoRXNOCh9kU1zcb1CwUQqz0CS
	qSw8ovT46q18Vaijga5hE6xAa+VQSjtjdOx+FsNXC5dy24UvCUVZ7Jj41aNBm9ZxcfplB6Ybj2NhU
	8bldlbZW4PKiFbDJhCBsYE6IXw95F77NRIjG6wxGG1jn6ZWNbDL4Iplqb5RqNBgNY+m1lBBPDJWeP
	yzTOk1Kh4eeRgys+ytqt3THr8XUGTHBfX06pUznBHIyEpLrjW0EDqiSihPmgTkzSzxrNP3pNvep+I
	NM5EjVEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGm6p-00GjwL-1r; Wed, 27 Jul 2022 18:50:15 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGm6m-00Gjtd-Pb
	for linux-mediatek@lists.infradead.org; Wed, 27 Jul 2022 18:50:14 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 413E43371F;
	Wed, 27 Jul 2022 18:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1658947808; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=17kigxGvW4oO2tVOPFkWCos9YzmgV9xkKWZ4CGN+uQ8=;
	b=SLuQle99oELpYuyDPVS05yBosR0Nna4Bweo+4Gi6Mv/UYoONOi8JumrhPcY3VzENkmxmMq
	doy/Nrp8jeVoFGb9yZ6VCnlLWx7yjX6OIKQ0bzHbOZNORvfklce/ePSBEtBHQOc+oGpP5W
	08hD7uffxz4yxpFvuf4Ts8UBtFnzQYM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1658947808;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=17kigxGvW4oO2tVOPFkWCos9YzmgV9xkKWZ4CGN+uQ8=;
	b=xORdcup2W6obmsRjxmakMi+W4NXFxHQuW+qMb1tpttieluQXq52lcVKjnwEAAqfw0WlIVi
	axgLzh3h0+tWF5Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ED68013ABC;
	Wed, 27 Jul 2022 18:50:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id d8diON+I4WIVPAAAMHmgww
	(envelope-from <jdelvare@suse.de>); Wed, 27 Jul 2022 18:50:07 +0000
Date: Wed, 27 Jul 2022 20:50:06 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Liam
 Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chenglin Xu <chenglin.xu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH RFC] regulator: mt6380: Fix unused array warning
Message-ID: <20220727205006.0ff42274@endymion.delvare>
In-Reply-To: <YuEug/OV9H0DKnmZ@sirena.org.uk>
References: <20220727132637.76d6073f@endymion.delvare>
	<YuEpGTD/DbC1T9Z0@sirena.org.uk>
	<20220727140809.0951b72d@endymion.delvare>
	<YuEug/OV9H0DKnmZ@sirena.org.uk>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_115013_016262_0C354976 
X-CRM114-Status: GOOD (  24.31  )
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

Hi Mark,

On Wed, 27 Jul 2022 13:24:35 +0100, Mark Brown wrote:
> On Wed, Jul 27, 2022 at 02:08:09PM +0200, Jean Delvare wrote:
> > On Wed, 27 Jul 2022 13:01:29 +0100, Mark Brown wrote:  
> 
> > > It's helpful to keep the build coverage high.  
> 
> > OF does not depend on the architecture, anyone can enable it. So I
> > can't see any problem of coverage with making drivers depend on OF.  
> 
> It still reduces a barrier to entry.

Can't see how that would be a goal. By allowing randomconfig to pick
configuration option combinations which do not make sense, we are not
increasing coverage. That's quite the opposite. We are limited by the
overall power of the build farm, so every test build of such a useless
combination is a waste of resources. We'd rather use that machine time
to test a configuration option combination which real people would be
using, as these are the ones we care about.

> It's also that it's easier to just
> prefer the conditional compilation pattern rather than either check to
> see which cases is needed or have people copy an example that doesn't
> use it when they should.

In my experience, there's always a very easy way to silent a warning,
but in most cases, that easy way is wrong because it hides the warning
instead of fixing its cause.

Very much to the point, the build farm pointed us to a combination of
options which triggers warnings which developers had apparently never
noticed before, which is a hint that maybe this combination is not
something we should support in the first place. We can of course silent
all such warnings with __maybe_unused, but that should not be our first
choice (else we might as well stop building with -Wunused).

Not only that, but in this case it might also be that we have kernel
code that can be removed because it isn't needed. Not much, but that
would still be a gain, methinks.

I also don't think that one goal of the kernel code is to be easy to
copy and paste without understanding what you are doing.

Anyway, this is your subsystem, so the decision is yours. My patch
removes the warning, if you are happy with it, feel free to apply it.

Thanks,
-- 
Jean Delvare
SUSE L3 Support

