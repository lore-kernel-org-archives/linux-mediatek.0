Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C235AC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jan 2022 12:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DrSQY1aE+ttQwqkGd8wp5KUUEf6B+dsVov6KV33BSi0=; b=j3QjQyzNQ/tUuo
	PLA/4DPDqhat0bklFe1sEl3AsOp4PXjlSfMc0oLHt3Jfed4MFiQfoImy1Eil3AeKmY8HaBiWYsuT9
	M9MhvtxNyZanJXhDUrpWcBxI+pUKTFl69GG/oEX2YkdZPrkJWAi5sMgRNWeu67fdbpa6YmrTI6Qq7
	MWYbs4W0zHBVOPajfcxJAW6xtAes4LQlzfXtHo1o0Ve1RJbjyYlmWwulVEqCmHqtRCV4vyUiiANk9
	FxAIGIyPQ25KW+1SskfNfe+yLro+/0hDDS1EJ7q6e/iIYHIv7VXJ50PrsfDjm6IGg2Icx+3xtmLp4
	DlYfDVhf0JB9bHGOPzOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEVxe-009MzY-L5; Mon, 31 Jan 2022 12:39:10 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDSHR-002ZDJ-47; Fri, 28 Jan 2022 14:31:14 +0000
Received: by mail-il1-x133.google.com with SMTP id o10so5594208ilh.0;
 Fri, 28 Jan 2022 06:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=C4xMgyj4PqtHIb3s8cThAMh+Lh46iAIWuvrZD5QJYRk=;
 b=meqn8q3qmMhmPn7IHm22UydlMZsrXm+9hvsOeMI1iRsrsRx7XB8lCSlYsxIt9xmar1
 B8D4H3QswMrnOFa9JiWgcYTHgYFogl4JKKtU7a+owPCu0H7ZWukuGQ9pk8dhoRcLPoKX
 jW73S37bs0HQtK2I4KiKUK9UQJ0AUGkjXa0Klz45SaR5IQ/ENGnRpijaoHVqAUz69LsD
 BNyHD/v52LZEVxQybYcqq0P7SvVN3+bfiONv7TBFQOM4izLNacb0FiLvomxDDF28PcYT
 5448gBoWUOK7bZKsYQljCeVhh9E/VetVvK9zusF42vGOjATpV6fomcGMlN+csFVknEY3
 tcNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=C4xMgyj4PqtHIb3s8cThAMh+Lh46iAIWuvrZD5QJYRk=;
 b=51iDaDAAYZq3RzZfUlmesw3eMRcFYzll4jNq8SBc3J2Bk1roRIxoMEzpf/olawJ0aO
 /++/V4Vb8h9gjbq1+Sh3+gE7ioBbceUaYqsxQ4IF5w0RaGIaDJo67uFRENOskiPeHk1O
 r0Eo1mFhO/XVF+8RZFCloYuOkPssUHvVHvOmsB3vIYiOcooZ33sRw6KOzzxo4uoFwQ8Y
 aovPY9BAb3KI7hKDwhSryapplZcQnr19eYSITGrvU2wKQXZPJ7GWONmeo0CBM6FMq+fx
 zEBN9fioxADui7Pck/X56r/tUwXUZLDlI7m1eVwdODGol6BtAgzg0FkCYpMt4XFsZPku
 3j8A==
X-Gm-Message-State: AOAM533sRA5vlMtvkJlj3PkYBrSkgnZHQmAgDuDW3ofUccogNZsRv3zg
 TCt6ABYqIIGfdsNe3Mmw8MA/2cmaZwnvm1LVxOQ=
X-Google-Smtp-Source: ABdhPJwIlR6QN9gEUt1QNafiQQTvcQbmWu08ts4aZeBcJTm4pDBxxahXyN4sFFtFPWtttwLRSghwwFtcZSKYlvs6Lpc=
X-Received: by 2002:a05:6e02:1564:: with SMTP id
 k4mr6165356ilu.63.1643380271899; 
 Fri, 28 Jan 2022 06:31:11 -0800 (PST)
MIME-Version: 1.0
From: Paul Mulders <justinkb@gmail.com>
Date: Fri, 28 Jan 2022 15:31:01 +0100
Message-ID: <CAOn50SK+g+gqxBiuHACfv=a0SjSnmdeGbC=LQyniHsZZApvF0A@mail.gmail.com>
Subject: Re: BUG: [PATCH v2] isoc: mediatek: Check for error clk pointer
To: justinkb@gmail.com
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_063113_187781_4E653ECE 
X-CRM114-Status: UNSURE (   3.35  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 31 Jan 2022 04:39:08 -0800
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
Cc: gregkh@linuxfoundation.org, jiasheng@iscas.ac.cn, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Correction: the "(so no mm block)" should be after "and MT7622
doesn't", not before.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
