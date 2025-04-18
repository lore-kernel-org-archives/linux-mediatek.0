Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46367C369AB
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Apr 2025 14:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ujkr31YJOU0i+vEy/KID/q33Ti6fzxSZz0g9mVmH9w=; b=GPcLWJqRH28psONHbh0XWjHUCK
	V+No+tijXosQy6yaata70Rto2No//yqkS8LTx7Z/noX8b3ZMI+db189MrL/lmWFye3vrVyeKErDYm
	8TDgjBOjw1d2/6k/sgAFzKAMnOGp4IcK2SZ7SvzKG4/eKIB0htDJ3VzVySnmuZzG2VkC7Kbm2q5zb
	KDJ2oSDVKNq2AXR8zuMdlkirksWA79fmtq7/oQhRnTtD4tz7qyMp5n/n0TlJCZ7Jwr8KCC/8+Eqhw
	nqpBAtQO7SiHcA+yzb4bU7Esub2W+Bkc/0clI5RRpf53x+eIMrls7nKrNvBaPNO6gA9ps6xVrITzB
	n4Qb6q9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5n8B-0000000GWy4-1chE;
	Fri, 18 Apr 2025 14:55:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5n6G-0000000GWJb-02WN;
	Fri, 18 Apr 2025 14:53:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E42D61120;
	Fri, 18 Apr 2025 14:53:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB144C4CEE2;
	Fri, 18 Apr 2025 14:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744988030;
	bh=g34gBYb6R4BnqUhzVUDHFk2+n+AlDlCAPcckXvBMohc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jAo1JDkb8KmWHnFshBsCPXK7197UdRywGCALDTHTnPjKS4ac7sOaPgTU9DHq08Ion
	 +mG44IldDVLUQ3NjyygzJ37ZBWDMTz2/lSLBr4VKI6HSO9TVoDKorJKD09nwDtRoDJ
	 bvQdppchkSYzPYKCVI1B90pstwj2JFyowpx+aDv3/WPW9Hs9pXdyVTzktGx55ovrdW
	 wyVOA8/UtTxvsCWeZc0uH+LcdogjLUkOE6bZIg5pyS372ASVCZX2NfEEYeHu1AIYV9
	 MTHvmZCGhUPl3/YWOIZ/Megi8WfA/tIwiEmIz+zV/O4co2gbiEiysYgg+mlHGk7TiJ
	 cDvc0PNcL2ejw==
Date: Fri, 18 Apr 2025 15:53:40 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>,
 "Cosmin Tanislav" <cosmin.tanislav@analog.com>, Tomasz Duszynski
 <tduszyns@gmail.com>, Jean-Baptiste Maneyrol
 <jean-baptiste.maneyrol@tdk.com>, Andreas Klinger <ak@it-klinger.de>,
 "Petre Rodan" <petre.rodan@subdimension.ro>, <linux-iio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 5/8] iio: chemical: sps30: use aligned_s64 for timestamp
Message-ID: <20250418155340.6d788efe@jic23-huawei>
In-Reply-To: <20250417183621.00001c67@huawei.com>
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
	<20250417-iio-more-timestamp-alignment-v1-5-eafac1e22318@baylibre.com>
	<20250417183621.00001c67@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 17 Apr 2025 18:36:21 +0100
Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:

> On Thu, 17 Apr 2025 11:52:37 -0500
> David Lechner <dlechner@baylibre.com> wrote:
> 
> > Follow the pattern of other drivers and use aligned_s64 for the
> > timestamp. This will ensure that the timestamp is correctly aligned on
> > all architectures.
> > 
> > Signed-off-by: David Lechner <dlechner@baylibre.com>
> > ---
> >  drivers/iio/chemical/sps30.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/iio/chemical/sps30.c b/drivers/iio/chemical/sps30.c
> > index 6f4f2ba2c09d5e691df13bc11ca9e3a910d98dc8..a7888146188d09ddbf376b398ee24dab7f0e2611 100644
> > --- a/drivers/iio/chemical/sps30.c
> > +++ b/drivers/iio/chemical/sps30.c
> > @@ -108,7 +108,7 @@ static irqreturn_t sps30_trigger_handler(int irq, void *p)
> >  	int ret;
> >  	struct {
> >  		s32 data[4]; /* PM1, PM2P5, PM4, PM10 */
> > -		s64 ts;
> > +		aligned_s64 ts;  
> Definitely a bug as we have no idea what is next on the stack
> so fixes tag needed.
Applied with:
Fixes: a5bf6fdd19c3 ("iio:chemical:sps30: Fix timestamp alignment")


> 
> >  	} scan;
> >  
> >  	mutex_lock(&state->lock);
> >   
> 


