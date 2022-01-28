Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30CD2C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jan 2022 12:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PoRV+1g5b8YSGCoefoUCa6pfNmq99o6MktdRw+mJw78=; b=IAmciLjxdSU8Vh
	5Qjvf8XLlTaF1E1DsZ8wnhwse+InDvkuyxMfregyKccDDLD1LyLb9ln36lNB/paJLDIgIzma6ke/S
	JPXgtEM6tzL3vb3DQF2xfjQ92s5VlYyA5fJLUtiZU3zXcoiYiyexqU3EX07+32S6v7g4rEtFg0+rZ
	pE0DmYN551YQ13Z0ZdDTPvIccIKQFjUFEbiBBRjxGssqomGM4JjgvosMSaK4gQtvV27Lf/uyO/3KJ
	sUPdRSGggJlNJWD2S5cAik2IzSKapvuQr06Vl+ET1Bf2KyxoXqiH7eRi/mjR6wOOPzt8PaiHc15kf
	g2PLC5unK4DCrviy0fJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEVxd-009MzS-T8; Mon, 31 Jan 2022 12:39:09 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDSDP-002Y6b-JW; Fri, 28 Jan 2022 14:27:04 +0000
Received: by mail-io1-xd36.google.com with SMTP id 9so7952913iou.2;
 Fri, 28 Jan 2022 06:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=1bnORB1wkruXjbPQsxwiOmxlipkYRK0gZn3m0VjNnds=;
 b=SUn5DhBkNrcBlytCHFJFy16BnTHHKOlrENp0Y4zwHCYFlFKQNIuiGomBzHMtZ+qAsi
 OBLc2BCaiODyaZlss5gLV8wm+Pbf65SzlM2pwCZtbwvhUFboozN0ECuNvBeBR9FO4FLD
 MfjI83r5SfoI6MNqGB+UFjXcLfeNF7J0xy53IVdQunfF01HtaV6yzucwe0yk/QVeLkdC
 WCgwxRWn7tiFrNm/hq9JYG+bb1gT4EwE+Z4HHFvjt/6KnsLFOm94bQ038m7b6oww7/do
 ShqyuaaRY7ejMQwFR+q9UnfTaNZ4h9go1C5gTTYENFb+VOIl4F/gJAkTiEgxwodMuT7Z
 2RAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=1bnORB1wkruXjbPQsxwiOmxlipkYRK0gZn3m0VjNnds=;
 b=XL9X/rtGM6widlKhV61+YpbdFSxyphdTPGLJe6DR+zsODlHOA9VFx4cRVJuLFq/QNq
 V1GCT0GiKst2CumF5/lAXz24m7IyDN0TTRAdg7cv0QU0y41cK2bhXXnaTsaEOTuK3t8/
 nqJHt/Aslnf7Aog8bHpAhv8Now5J/XYaEWiyI5oGXRQJOUM5ozz+ElCFzN6sia8r1dde
 AWXtqom2N3PzRrTL4gxhF13MspW1QgAjIDaKxSOYJiPUKqO0WfCb+DOMZ9Zt1k1ssEK1
 Nt0bACT09vCpWomrjsaHu39+AQr3BQNePuJH3OueDAAHefaJOGn/gTJ4/7bM135yp+Go
 weuQ==
X-Gm-Message-State: AOAM533AXWO+TVT1/0gCElKAIWjHnKkPXzG2Pz/cWXsaf99JughfqDuW
 RI5cCLwT1qpY+qIfjq0ZID3NdwTXvZIHbubARqo=
X-Google-Smtp-Source: ABdhPJzd8keAgM79DYn7n5v3WjsKD74dnSWWSrq330nhqT0U0c7r5t4OGDflnZvo76hcpMuIexbijpFuoZz75hJO6VM=
X-Received: by 2002:a05:6602:2209:: with SMTP id
 n9mr5413049ion.106.1643380021757; 
 Fri, 28 Jan 2022 06:27:01 -0800 (PST)
MIME-Version: 1.0
From: Paul Mulders <justinkb@gmail.com>
Date: Fri, 28 Jan 2022 15:26:51 +0100
Message-ID: <CAOn50SJrdS+uRnJ=e1vrb6n5e1TSWLBiLDdZe=7tSCXRVwtTjQ@mail.gmail.com>
Subject: Re: BUG: [PATCH v2] isoc: mediatek: Check for error clk pointer
To: frank-w@public-files.de
Cc: broonie@kernel.org, gregkh@linuxfoundation.org, jiasheng@iscas.ac.cn, 
 lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 matthias.bgg@gmail.com
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_062703_693646_1C3AF1B9 
X-CRM114-Status: UNSURE (   6.65  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

I guess this breaks all MT7622 SoCs since it'll prematurely exit
init_clks (and subsequently init_scp) completely once devm_clk_get
fails to get a reference to the mm clock producer (which happens to be
the first one tried). This is because MT7623 has a GPU (so no mm
clock) and MT7622 doesn't, and as a result the other clock producer
pointers never get initialized (and other stuff in init_scp after
returning from the error never happens).

The patch seems fundamentally flawed, I guess it was either not tested
at all, or only tested on a MT7623. The initialization functions seem
designed with the idea that it's ok if some clocks aren't present, so
stopping the initialization when one of them isn't present seems
wrong. (For example, there is also a MT7622B variant of the MT7622
which probably also lacks some clocks MT7622(A) does have).

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
