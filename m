Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556B0C77B7D
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 May 2023 01:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nRiWGp52ftlfW8uMdyTbOyMwGQ0nyy4tXUjVPjkaNKI=; b=IcvjcE0Y9GZKWl8ZKtYlEI00+T
	3SUbluviFZ1Tuv9I74SYCKHgAsrFYM/aAjJJndOuKTJdS2k98RhmiuIoXgAj7xikGv/e7XC/ZYYic
	gLuJSY8yBp9rYD69CVLucuWqtPkDgP2816QXRwz4KfMOA2JqX75INTNw2Pq3Bpb010J0NrwOdi94o
	agivM/ltF+dmHQVZSVTKoLdkU3jqkwE2qNTF8X7LyrYXJ8w9tJYnh/7ZNcIMkCGqNwKvULMBTDVKx
	hjdptT+IiQhhuDakTJIMpBImL3t1VJmQdrMuE+Y/5PfAslj5kmrzr6FpJbpHtUvH3ZBRQA3mOLwqm
	cZc1PYUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwv5f-007RC8-0e;
	Thu, 11 May 2023 01:27:31 +0000
Received: from m12.mail.163.com ([220.181.12.215])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwv5c-007RAc-0k;
	Thu, 11 May 2023 01:27:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=nRiWGp52ftlfW8uMdyTbOyMwGQ0nyy4tXUjVPjkaNKI=;
	b=hxGfT+r8XUR/NfkrPRyXguLG2DBK40+RZFu3yZo2C9G6gU+DvfQgm39lFz1e9q
	SHbXTwgdRFKik8Idjh4KrpqAlyBOCTNxcgSOLDUlC1SzGxhkyYOQpuQ8i1fowEhN
	4hLEF5UtDYiKGUkLdQgSrQHNOu0HhezXC6Y7sLuHocEGQ=
Received: from haoge-QiTianM428-A376 (unknown [116.128.244.169])
	by zwqz-smtp-mta-g3-2 (Coremail) with SMTP id _____wCnVuNfRFxk2VIuBg--.37991S2;
	Thu, 11 May 2023 09:26:55 +0800 (CST)
Date: Thu, 11 May 2023 09:26:54 +0800
From: Hao Ge <gehao618@163.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Hao Ge <gehao@kylinos.cn>, angelogioacchino.delregno@collabora.com,
 matthias.bgg@gmail.com, mturquette@baylibre.com, wenst@chromium.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mediatek/clk-mt8173-apmixedsys: use devm_of_iomap to
 avoid resource leak in clk_mt8173_apmixed_probe
Message-ID: <20230511092654.6d8fab41@haoge-QiTianM428-A376>
In-Reply-To: <b35458250af972d95c708792633c9a58.sboyd@kernel.org>
References: <20230509021214.17105-1-gehao@kylinos.cn>
	<b35458250af972d95c708792633c9a58.sboyd@kernel.org>
Organization: 123
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: _____wCnVuNfRFxk2VIuBg--.37991S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JrWxAF4kWF17tr4ruw1UAwb_yoW3Grc_ua
	1ku3Z7uw4UZFs7GwsIkr9Fk342y3s8Wr98tF95Za4fta9IgryavFW8C3y3ArZ8Wa48Kr98
	Ga9Yga1kZF1SkjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUU3xhJUUUUU==
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: 5jhkt0qwryqiywtou0bp/xtbBaQRsFlXlz21ORwAAsM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_182728_641618_65978FD3 
X-CRM114-Status: GOOD (  11.68  )
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

On Wed, 10 May 2023 14:18:08 -0700
Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Hao Ge (2023-05-08 19:12:14)
> > Use devm_platform_ioremap_resource to take the place of of_iomap for
> > avoid that we don't called iounmap when return some error or remove
> > device.
> > 
> > Fixes: 4c02c9af3cb9 ("clk: mediatek: mt8173: Break down clock
> > drivers and allow module build") Signed-off-by: Hao Ge
> > <gehao@kylinos.cn> ---  
> 
> Is this v3?
Hi Stephen

yes,Perhaps you are too busy,I have not received a response
in the future, so you are unsure about the status of V2.
So I adjusted the code and title make changes smaller and
sent V3 for it.It is precisely because of these that I did 
not continue the original mail thread.

Best regards
Hao



