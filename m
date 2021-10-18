Return-Path: <SRS0=fNpG=PG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A77BFC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 08:43:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7248E60F8F
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 08:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7248E60F8F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WfQhM11YzQTcbeqZ3V/RIYG7gLykryc1fA7hCFvNobQ=; b=njzEA699+yx2dC
	Yae8r/NLP+yNUWXGq8P5E1BfQ4hrZhBPyFkO4SNxbMVv88wO8MI+44M+SwA9uPLTDaFOn+hoXjaIs
	CUBBGouFe8wU5AyCzLZbRJSnsBkScxJf9ZtVkJ9rP14IRCQ5oAkg/8SpA2Ok2k6e9xZnFmFFGuIj6
	pE4IaNijfQ+sRKzU4VZ+uo3eq9vpav8vpwoq/GezzG6rzedJDQRaYTfDI93lKuUqKa+WFPZbp2uTb
	8WrGJW4Wen5HqX52Vpn7bPNm+ONjMThhRrxmlvLxyz8uq6Z4d0xEbF4V6G7ZL0qelpfUHo//N/5yE
	ZgK7r6ZYsE1FItzjDXzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcOEO-00EgF3-OQ; Mon, 18 Oct 2021 08:42:52 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcOEC-00EgC6-Kb; Mon, 18 Oct 2021 08:42:41 +0000
Received: by mail-pj1-x102b.google.com with SMTP id om14so11698282pjb.5;
 Mon, 18 Oct 2021 01:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-disposition:content-transfer-encoding;
 bh=DAyRWJeM7WcXBmJfC8EYVSatAo1tUAa025hjrvqygj4=;
 b=pjkO0MkdRmY5FkfWW+EfXlo7coSyNA0UvLvaremgQ0bVxp1yk8zUfFBuLWo3vptr6g
 a8MwQHjz+iMGgp1Leq6G2BYTatimamqvnfcfKKxI1+WbcOLJAB8UBAp+r9iZ5Xg+mHSa
 1NuHjrmSUkaD9IKUixkCzMpvwe/0C+iOgTBN3CjWMmQzjMuVnXenqGHQfdlxzDe6CKWv
 z1SeLPMNTGiSepavXDsSHZoDc5NkxoPsQZ9/3ffhRep3fA8UPncN+0RfiGU+6TD4TOHb
 rscUJw5JZ8NQZ6ea+J42gVaBQREDiL/TFnYprSWPeYQ0fzOXDc22Z++8CoKi5p6kNNG5
 JLwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding;
 bh=DAyRWJeM7WcXBmJfC8EYVSatAo1tUAa025hjrvqygj4=;
 b=AbfchQ6nGEbEHILm+N3NtLOs6DrJVhwFbvwFLg49825sMgFdVvFRKYNANT9F28iW/r
 3tXFA+zsSuYJrh5Kf42driOB74SPWLifx4PA/WRqU4jpLwRHqZ0YJgMpX7hOqnZ8ihPz
 nHgSHXA5mh6djrQQ+EYbwtQNUqO94pWLNYTqHWykxL1HJWrOW0IP96WqSeXHVys8/GwY
 96EdX7rtPpur6BEgJ0MPN1vk3g1XO5gV4ZPskEbxJZIsPXeNZp03ZVX99fMiGgJWn77N
 OieF3w3/vs9K9mJ2PnPI48Eivmq07slvlxMsQGujrBppRTgGnm6p4oK/rLV/zuWCxg8m
 K5NA==
X-Gm-Message-State: AOAM53036MiXeeUDyYp53AWPapm+ZfwWfw9KBKbg93p7DdlxfjWAIOJe
 4/AYGgqqjFvgWA8Vd8YNrfc=
X-Google-Smtp-Source: ABdhPJyYoLQM1iIllEwgPR6qgb4iSpGJ2GuiYzUTfZIXXF0pt3/TERwOOPTiYDZi2i8s2Qh/vmQT+Q==
X-Received: by 2002:a17:90b:1b49:: with SMTP id
 nv9mr31231964pjb.134.1634546558838; 
 Mon, 18 Oct 2021 01:42:38 -0700 (PDT)
Received: from localhost.localdomain ([171.211.28.7])
 by smtp.gmail.com with ESMTPSA id x13sm11727906pge.37.2021.10.18.01.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 01:42:38 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH net] net: dsa: mt7530: correct ds->num_ports
Date: Mon, 18 Oct 2021 16:42:30 +0800
Message-Id: <20211018084230.6710-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cd6a03b9-af49-97b4-6869-d51b461bf50a@gmail.com>
References: <20211016062414.783863-1-dqfext@gmail.com>
 <cd6a03b9-af49-97b4-6869-d51b461bf50a@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_014240_704698_F328C13B 
X-CRM114-Status: GOOD (  13.22  )
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

On Sat, Oct 16, 2021 at 07:36:14PM -0700, Florian Fainelli wrote:
> On 10/15/2021 11:24 PM, DENG Qingfang wrote:
> > Setting ds->num_ports to DSA_MAX_PORTS made DSA core allocate unnecessary
> > dsa_port's and call mt7530_port_disable for non-existent ports.
> > 
> > Set it to MT7530_NUM_PORTS to fix that, and dsa_is_user_port check in
> > port_enable/disable is no longer required.
> > 
> > Cc: stable@vger.kernel.org
> > Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> 
> Do you really want to target the net tree for this change?

Yes because I consider this a bug fix.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
