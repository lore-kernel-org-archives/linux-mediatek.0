Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA272CE79D1
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Sep 2023 13:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/F+EvXy/jfn0bD++OL6jT5lV4OBJOAv0uv1Ij3xsfKk=; b=dwzDsmDakRJ2kepWzeBZgPksw/
	PA/OnHawbVRFrm8V6LZLg9O2ut+VzH2NQZ4lYOHfZpfoxVioZZCQpv1F7HL7BlFvzxRjCw30N0y04
	45NeVhm9fZLMhs3o7i1PxMYT70f3E2ue6aC0EnicW7mgxuJOPoE/Ygz7rqsEG3esllywls+i+/wXP
	0iXjBce0zcS8W4SIn04/UFt+6GcopxfI69xb+vCwDlANqIMfzDgQurFH5PjfjBxmc8f2GbkEJ5JmX
	yded6rmzDKfKNXzEliaDtHJu9xP+4/Yo/rZmZk9P37aQDpzL/Jj/JBgITDIG9DryXcHfGPN0T7LqS
	mwKysGTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qixaz-003E7q-0h;
	Wed, 20 Sep 2023 13:50:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qixaw-003E6a-10;
	Wed, 20 Sep 2023 13:50:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8463361C4F;
	Wed, 20 Sep 2023 13:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA712C433C8;
	Wed, 20 Sep 2023 13:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695217820;
	bh=F0w62KOri4+nv8ORRuidRDPCFETZBxnGyBhVgs19590=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hg6DG5H3voBk4yi1xt3gVxtpWKQwL7f+Xg1hqn+I02tKlteuaHdIGKPKgtDakRgHe
	 fmTD4cXn9KSlneOaoR3WQeicN/z5g2sgz/GofMHLn2z2F/Kyq9qU759Hg/vdrQ9k9+
	 5GAsapzYRZKp+opUKaAuXToOADpp6z9wcbbM6BxUWb94RZPxGvjtMtqV6fgzlNvDaP
	 U3v9zQOXnETzESzXbZFX9czV0eXkXknpCFGA7j2WDmd664c/xI9KbMJvScvEvEr1MC
	 1GqH1UznXTFpO8/Moj4m1AZEMXxI5OA0W+bL79vIF5i6YBaTfWh6tz7tsdp83WBSe1
	 j9QypSGog46Kw==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Kees Cook <keescook@chromium.org>
Cc: Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Gene Chen <gene_chen@richtek.com>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-hardening@vger.kernel.org
In-Reply-To: <20230915201020.never.433-kees@kernel.org>
References: <20230915201020.never.433-kees@kernel.org>
Subject: Re: (subset) [PATCH] leds: mt6360: Annotate struct mt6360_priv
 with __counted_by
Message-Id: <169521781759.3448785.6991953068239903845.b4-ty@kernel.org>
Date: Wed, 20 Sep 2023 14:50:17 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_065022_388850_EE22FB2F 
X-CRM114-Status: UNSURE (   8.57  )
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

On Fri, 15 Sep 2023 13:10:20 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct mt6360_priv.
> 
> [...]

Applied, thanks!

[1/1] leds: mt6360: Annotate struct mt6360_priv with __counted_by
      commit: cecdfff8f5c82816d8b9ef2f4b3d7f4943dfd360

--
Lee Jones [李琼斯]


