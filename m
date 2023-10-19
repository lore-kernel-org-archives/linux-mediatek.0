Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65867CDB482
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 13:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2cNE1nD+f5XXbe8SV+FdMXaOF2j/f3k6LirCh+aRx20=; b=AeC4ZeBX6kXULNZtFDhWlnEd8H
	VMfcsYaOt2/q/u0E9SQjBy0Z1pE5jCPUSWrvRuCzgFC5mRQ8TPnEmoFAqJQnfitx84ELLPDaVl7i/
	kIYAhvgVSCNtjS5j8kJfLUMODYkHZF9lIrkeSDBEUmYfxDAqdtZcuT5gTngFECmgTTNAYjSkcFjjF
	Lva8iV4cAR48RACRA1M4CpclWri/uB/LQeQ+qGZ5mg57d/Y97hOPjLWeA9qX4gDmO+Dm1saV4boBr
	hU1Op49Q4SUOBdKSxhnectWUBUbMXyYr2q9vb1tAEjInGYhtEukUmPGSruAzAwivzy6WZhN9GYw07
	dz+Nn+ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtTVY-00HZsh-1E;
	Thu, 19 Oct 2023 13:56:16 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtTVV-00HZqV-0w;
	Thu, 19 Oct 2023 13:56:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 37EE0CE2CCC;
	Thu, 19 Oct 2023 13:56:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4BBDC433CA;
	Thu, 19 Oct 2023 13:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697723768;
	bh=yZ/ARB3p2Ke8tobvsFJ9flTddNYrmRG++q6KJRo0w3Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tc74ML9w33RHuzPXDk4Y/0aY9YgCu4WG2S+FQ6bNMA5UdG3O8Mb3PgIAQ7Tc+a3Q/
	 0ZL5nTecGbR8+xaaPo4O/FiCJVYmgI27BJ2lgquzmTQQR8JgyS6Ymj2IdCbyK9IBPa
	 81/sPnuoj7QsXhkHW822S2PbJMLzH+gRvjtTwQVioEcS8HoIf3/WRbPUSwffmZoMJK
	 LOonxjQLVsqd2n+87kEzJst2h5dF/St27OteDkkSqAhF0cccL+nCBW9uWW9aVyLH/f
	 tP04RxZbcGQo0ecHgE6XeIWOsl0kPN+3eczB7zs8or/sOJU2U098PDuONOzIaHv81/
	 v9ZzTgUYDBw9Q==
Date: Thu, 19 Oct 2023 06:56:06 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: <davem@davemloft.net>, <pabeni@redhat.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, <bpf@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Alexander Duyck
 <alexander.duyck@gmail.com>
Subject: Re: [PATCH net-next v11 0/6] introduce page_pool_alloc() related
 API
Message-ID: <20231019065606.525309a6@kernel.org>
In-Reply-To: <fd8a3e6d-579f-666d-7674-67732e250978@huawei.com>
References: <20231013064827.61135-1-linyunsheng@huawei.com>
	<20231016182725.6aa5544f@kernel.org>
	<2059ea42-f5cb-1366-804e-7036fb40cdaa@huawei.com>
	<20231017081303.769e4fbe@kernel.org>
	<67f2af29-59b8-a9e2-1c31-c9a625e4c4b3@huawei.com>
	<20231018083516.60f64c1a@kernel.org>
	<fd8a3e6d-579f-666d-7674-67732e250978@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_065613_497940_47E94345 
X-CRM114-Status: UNSURE (   6.18  )
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

On Thu, 19 Oct 2023 21:22:07 +0800 Yunsheng Lin wrote:
> > Sounds good. Warning wrapped in #if CONFIG_DEBUG_NET perhaps?  
> 
> How about something like __get_free_pages() does with gfp flags?
> https://elixir.free-electrons.com/linux/v6.4-rc6/source/mm/page_alloc.c#L4818

Fine by me!

