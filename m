Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BE1C27C4F
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 17:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0cYsn/reiFGxyzaxBvIUFRxhNp+Xcdk9EZuauXuRcOg=; b=jMwM/TTLa0t2BQdUxawnR/9+1R
	lbqDpd4EAGlPQYC8vJcPJRbg2K9+77V+dPXmvQMT6kQjfwJpDlTZajIgw8HExBCCaagtceE3BMYxr
	u3KdUHxTQqwcDlZ7GzIphH4or1o6Kab69wF+N9uj+E2JXIleLF0nyqMoa34xE96HX6n4+vAXQesZt
	smeuKXo168KvV9Azh4Hxh0jtn3kqKBi/ud6p/LGWOema5znkU1R+EyIZimxr5ar/AZdoFWRhE5jeE
	+m7pPQSGLdFfUWMLuRiBfww6so+F6Pt8sZX3dDWkhr3KeIBN+7AMWfeYIN5IiPX3pogwbNuExLiV4
	7/Snjsug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHo6M-0000000HUjr-08cB;
	Thu, 13 Jun 2024 17:19:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHo6H-0000000HUhY-2CDy;
	Thu, 13 Jun 2024 17:19:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DAA71611DD;
	Thu, 13 Jun 2024 17:19:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEB0AC2BBFC;
	Thu, 13 Jun 2024 17:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718299140;
	bh=/FRqBJ2+W9oi2BU9wQ0dzEOCrTnN9o8UYQjQ6KKGegg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QPMe2W5qRO49VpynzkQuyjHER7fJc/OxSZSqr+1Xx9xtGDumzv7UBy9TSDnOdKKub
	 bD6ldak9xEoJTTwfRO3is+ngcveTbe2DdZy9aVkjit7bJAl3+NBuRImqcEiTan15Yd
	 /c4j47b5mVPzW33yO5C92LsJm5yr1qxX8pAuYzhR2zSVx+sBnjiPoojsjiV0uyJJMa
	 8lht12SgN+ELZgs8SWoHMuCkyVuucbl01YMwvjuAfYYK1mnfaF/wFM/PX16tayzNWK
	 MwyDu2XWxMYD8jE3545aYxKhyRtIIboV//Do5w4qXTJCLqXUCqo8+6f2gDFPrhyX83
	 SoNs6J7D7g89Q==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 stable@vger.kernel.org
In-Reply-To: <20240611-leds-mt6360-memleak-v1-1-93642eb5011e@gmail.com>
References: <20240611-leds-mt6360-memleak-v1-1-93642eb5011e@gmail.com>
Subject: Re: (subset) [PATCH] leds: mt6360: fix memory leak in
 mt6360_init_isnk_properties()
Message-Id: <171829913865.2730656.15082928550080844498.b4-ty@kernel.org>
Date: Thu, 13 Jun 2024 18:18:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_101901_620064_48650EFC 
X-CRM114-Status: UNSURE (   7.78  )
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

On Tue, 11 Jun 2024 00:40:26 +0200, Javier Carrasco wrote:
> The fwnode_for_each_child_node() loop requires manual intervention to
> decrement the child refcount in case of an early return.
> 
> Add the missing calls to fwnode_handle_put(child) to avoid memory leaks
> in the error paths.
> 
> 
> [...]

Applied, thanks!

[1/1] leds: mt6360: fix memory leak in mt6360_init_isnk_properties()
      commit: 6e0b2281085191fbf34fb24ef272cb44a82de4f0

--
Lee Jones [李琼斯]


