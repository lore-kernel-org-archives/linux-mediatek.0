Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D853BC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 16:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mhhSy4rx+juzfZnxZO1u05TOHCqraKR2QGa8y/gCDRw=; b=2JQioY8khvRU5k
	ata+0IC5ZpyTheUOFuWBZc39otdODxh7NbRQem1y349k++/RkthpMNFhd3sJcLdxnWuHig0TrtSot
	YWyCLelSD4ytzUiNFLFn83tylp6/j+gjCJy8Ct7pP8PiGG4dGETfWQmB0cDC4VT9mQmEqXNZjiN/a
	bHKOXNdWCzBk+5/W+BWHJiHXLnQh94XZWiYEyJ8ut1MgUlgDJaRiHOJ3lysOLv8cl3DA5xOuOSmKb
	HB+MPDo+3ZYKLj8imtgvWnHH8MzJc034aK5R501CNu1Rk83ytmay5g3Bn9VlMJLSEFtwzuS4c0mXH
	A3Y7B53/8/saG2bNVqEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neJDS-00F4lX-Is; Tue, 12 Apr 2022 16:18:06 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neJDG-00F4iN-Ej; Tue, 12 Apr 2022 16:17:55 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id CB88F1F44415
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649780272;
 bh=HG4zMAQTMsRTHk1kQ+DW7QY45qxSF73vy5Es63Yx/Hs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ie3NRjpwbAQ6cKLOUQoYITA6lfCLeBMXZqyKTetVNOwu1eFOnlDIS0Hyl1ms1j+hU
 CWOJDqVXrI5AdKOkIllkSsrz7hrLwsPJnS9Lo7jPIeMg7Haa0JyzweD+PRe0JVHK04
 ZdlRENGtXaYzDJkDtrAOgzDh2HuOBspLV5vsR5KvgvMnDPjBV9GuGDNfdc8Zg1ayuo
 FtTuW85jObOrIekLzn62cGHsY6Dn2+F5biP5AN/aBfvU/5q1WAtgooD7FRil6SaE+d
 +9sTEHPcko2Bzusdvyvz0qWsvXuJOVIe/j909WNAbo4d2EucJ2a9qTbxxjgbf35+8g
 Gdk3RqTWV2VbA==
Message-ID: <084cce2b-5c50-1d14-70f8-a313d61b901d@collabora.com>
Date: Tue, 12 Apr 2022 18:17:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] spi: spi-mtk-nor: initialize spi controller after resume
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Ikjoon Jang <ikjn@chromium.org>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220412115743.22641-1-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220412115743.22641-1-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_091754_667767_4B3637FF 
X-CRM114-Status: UNSURE (   8.11  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 12/04/22 13:57, Allen-KH Cheng ha scritto:
> After system resumes, the registers of nor controller are
> initialized with default values. The nor controller will
> not function properly.
> 
> To handle both issues above, we add mtk_nor_init() in
> mtk_nor_resume after pm_runtime_force_resume().
> 
> Fixes: 3bfd9103c7af ("spi: spi-mtk-nor: Add power management support")
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

That's just one issue, not two, so... "To handle both issues [etc]" should become
something like:
"Solve this issue by reinitializing the registers right after resuming the
controller"

After fixing the commit description,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
