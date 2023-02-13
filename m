Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03922C636D4
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Feb 2023 13:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qgkug+k8MRaxvHhyz3g02hyZ9Wk5TRp+jzL8m6fkolU=; b=2udTza0Init5P7r5yKd71IaHdc
	miu24GqO/brbt6OerNu+AG0zIr1Ed0VKYBhY8iSlOi6xTP98l25/xOHM6u/j93OSjB+AjttpUbBWU
	pX9QkrknpBEPk9v0D9YT8ueCCCQjgPGETHMCMWJBrYuvcqR8MJyyBE0mnb126gM2/x8AFBVILi/uH
	bEbupvn6Kvif9N2F0iUszhVSkeh6WZ1pTMQ19+1g8Q5USo/teAiIzDJ2GY9xYoWXCx+qXPJQgQefO
	05dk8bwTh5Txtxr4QM5f5v677rt0CPj8DnrJJfZ0mI3QsFTMdWsR9FM1yb8zWzniLDHYmXPSkguAC
	w+E1LxuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRZBy-00ErkM-Gd; Mon, 13 Feb 2023 13:48:26 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRZBn-00ErhT-Pq; Mon, 13 Feb 2023 13:48:17 +0000
Received: by mail-ej1-x636.google.com with SMTP id qb15so29930965ejc.1;
        Mon, 13 Feb 2023 05:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qgkug+k8MRaxvHhyz3g02hyZ9Wk5TRp+jzL8m6fkolU=;
        b=aFReOqTaY+PNWxTCkXEX9L2yJFY2wYUQS3onqFLxO4eHmQlpEe739GJAOZZvG+XmD4
         6j05mv3s29lex83RMuu/JfNoWTnCHRCnW8e0U7XX6vELTmZMBquw2w9gWDGplQNSWttG
         2xuiLL2m2Vh6uKrywztokGukEPEshujd4uxw9uJ9wQiw/zd/pm1GM9ROwmmxgyxs/ilR
         1eJRQrBhEbAcKLqlwiY6xWN/zmsl5tXfRiKjgd2VnOjuUei1SfALBHDWhVNhLNRIgivj
         dtIXSRgE6Tx/oBv0+VojlMH2PvFARwW0DzS9sAgY5pQ0xCjCV3u9SAFuY5CUIK3rQzr7
         bjAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qgkug+k8MRaxvHhyz3g02hyZ9Wk5TRp+jzL8m6fkolU=;
        b=DiBAyuzFdGoMKeaKp7cqkivsdQ2KqCtH3Sxub4Ru37ICMJJmxPOUK0A0YxbaYt+KsT
         NObevBwj1a1quTq7HU4cPdjvaBeHKypMD6pzdh6UrS9VTEYIn9gTiYRQIcT2g6zInGNn
         K1tvbLIbJtFfke37IyZsaO018uJXLQkCX/3WiofzZkmVQTTpHI47KfUZENZfp/QzWnnF
         0WDRIY6QxTY9bamxR8LXNiGtQ+pl4QkLN3rnBNjVD/iSI+/LJAnB3r4KmSUVCDshptWH
         zBBQJ8EhfRvHLVb0kv4VAhR81b3yHid0jGNSetEHNyG5zu/+Q3L58IgJHM1eb+t2G2Yt
         nt3g==
X-Gm-Message-State: AO0yUKW/O3E+PNf8iDdPzH64k7jTrWKmKeFidmLqXUJ0NpN/qkXitWKl
	03QqzUxfiUXCp1zOt7kKrOc=
X-Google-Smtp-Source: AK7set/SAf7iUOkmXApeTAGnEkgtW3PQL2Pg3Htd7kEadyL0tpNbDVsHhXAm2dhe6neJvnEoIoapBg==
X-Received: by 2002:a17:906:1515:b0:879:ab3:93cd with SMTP id b21-20020a170906151500b008790ab393cdmr24935089ejd.46.1676296094005;
        Mon, 13 Feb 2023 05:48:14 -0800 (PST)
Received: from skbuf ([188.26.185.183])
        by smtp.gmail.com with ESMTPSA id b12-20020a170906038c00b0088f464ac276sm6739560eja.30.2023.02.13.05.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 05:48:13 -0800 (PST)
Date: Mon, 13 Feb 2023 15:48:11 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Richard van Schagen <richard@routerhints.com>
Subject: Re: [PATCH] Fix Flooding: Disable by default on User ports and
 Enable on CPU ports
Message-ID: <20230213134811.elcgnzfryyxxegau@skbuf>
References: <20230212214027.672501-1-richard@routerhints.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230212214027.672501-1-richard@routerhints.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_054815_880721_588CA686 
X-CRM114-Status: GOOD (  10.78  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, Arinc Unal <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

NACK.
- the change needs to be localized to the file it touches by specifying the
  "net: dsa: mt7530: " prefix.
- the rest of the 80-character short commit message needs to be a well
  summarized description of the change.
- any time the "fix", "broken", etc words are used, a description of the
  breakage is expected, and its projected impact upon users of the driver
- patches which solve a bug must have a Fixes: tag pointing to the patch
  that introduced the problem
- if that patch being fixed is in the mainline kernel already, the
  --subject-prefix of the patch must be "PATCH net", otherwise "PATCH
  net-next". These correspond to the net.git and net-next.git trees.
- your signed-off tag is missing
- maybe more problems

