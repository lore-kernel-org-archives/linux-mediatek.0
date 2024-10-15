Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5B5CFC276
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 09:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WP+N4UsAZPKjj4EmRlhQL6H0TyFGjSIDUToljQw55Cc=; b=yWLVRGE0Yujs5fn8RoVmrGBCnD
	sem8lx+KRfsG4ZhjyIVKuzyRL/4Qg4K73BqDp6BIkaEvNbF8OBrWk2v1pEdr1osTTfgGfz8qx7KgM
	vrVeEMCATvqKzJ4FwBHqZPTN/coMbaATfn1Uq2u93r3FcHFk2b5LG0AgIu5pfO3B5LhYSA2xPJrmD
	/sHAe8+cX4lCcW+U+03Rhy2IpaU7RFRJI11XdRkpqDwMmdi5rin6XH6+x6ZAuLzIbjY5nSFRbetY1
	3zogn8lRmmtqMDNEohZ/b164ouCUc+C2wKoOl/ilUZg9FZ2KyTUHYMoO/Pjdvu19UE9AsbJ4F2fje
	1KHpeUBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0dcN-00000007eo6-2QnB;
	Tue, 15 Oct 2024 09:13:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0dOC-00000007axW-11Y3;
	Tue, 15 Oct 2024 08:58:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C05B75C5C2B;
	Tue, 15 Oct 2024 08:58:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC14C4CEC6;
	Tue, 15 Oct 2024 08:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728982726;
	bh=jAGoNoLVAbRIcXL7z9HRSFMPr+Mhu705XIwf+Uer1jQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mL3AQxYhpqOS657KY4KyNUFpIpD0dZiiW8+n21zMH916n1KfWI2lTQ5OwCKcsgiaO
	 MMmDNerfrPDwONsQjoORWai+TitJErYqNQRtHr+9GBnXU7GL6QOoVUPBu1Fxh26AE4
	 41j0WRrEZXJoTUHrBK2IQ6jHVpQzWpmuJnrx4VsDJUNOLzJOlGRSbnNaZUFkmjkNe3
	 zGDupd0EbdeYEBUp67fLA+XGOPsEnG3+btDBBgw8akmvG+GEMUq6pFmZk1MOa8ZJhg
	 7AbZTooqfZru4R9+OXZi8aVQdkFNpc1a+QsA6Gzrke5aczhY+AOOa42gE3VR7f9hSa
	 r/d4sAAMDOryg==
Date: Tue, 15 Oct 2024 09:58:42 +0100
From: Lee Jones <lee@kernel.org>
To: Suraj Sonawane <surajsonawane0215@gmail.com>
Cc: pavel@ucw.cz, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: (subset) [PATCH] leds: Fix uninitialized variable 'ret' in
 mt6370_mc_pattern_clear
Message-ID: <20241015085842.GC8348@google.com>
References: <20241006131337.48442-1-surajsonawane0215@gmail.com>
 <172863776565.3130628.18378710932238203204.b4-ty@kernel.org>
 <7274be28-aefe-49b1-b8e1-dd1c2bad96d0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7274be28-aefe-49b1-b8e1-dd1c2bad96d0@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_015848_345210_9B371434 
X-CRM114-Status: GOOD (  12.19  )
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

On Fri, 11 Oct 2024, Suraj Sonawane wrote:

> On 11/10/24 14:39, Lee Jones wrote:
> > On Sun, 06 Oct 2024 18:43:37 +0530, SurajSonawane2415 wrote:
> > > Fix the uninitialized symbol 'ret' in the function mt6370_mc_pattern_clear
> > > to resolve the following warning:
> > > drivers/leds/rgb/leds-mt6370-rgb.c:604 mt6370_mc_pattern_clear()
> > > error: uninitialized symbol 'ret'.
> > > Initialize 'ret' to 0 to prevent undefined behavior from uninitialized
> > > access.
> > > 
> > > [...]
> > 
> > Applied, thanks!
> > 
> > [1/1] leds: Fix uninitialized variable 'ret' in mt6370_mc_pattern_clear
> >        commit: b5a5659aebfffbcddb81abafe042fb4044b6ff9e
> > 
> > --
> > Lee Jones [李琼斯]
> > 
> Thank you! I'm glad the patch was applied. I'll ensure future patches follow
> the necessary guidelines.

Sorry, this is a tooling error.  The patch was not meant to be applied.

Please resubmit it using your updated .gitconfig file.

-- 
Lee Jones [李琼斯]

