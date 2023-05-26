Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B54C77B73
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 May 2023 17:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PTiLq4ygH0IvGpIu6yVKyZxG0Q1NzCebyg9n2MhnoWM=; b=obwyHumDsyKXfhJCZ3INHDaHQg
	GNu2uNLi0mB/6HH1/zjKNhV2RDHThvFIAMeBz3qqjko7Z62Oq0Ddk8dHTiQogUX4EHwS2mU2qIhnV
	j24U78ri02LRm9F62SCtciO3b/A5DekD+kkaS4giAj6wrmyQRycpoYgV2W2IU7p53HWH0xgBi4IvY
	TjlBEdli9G80WOzWI6xGPXgvL6EoqRGJAYV4CNWyP0aku8e6IYpFi+46xD8l6qdWub8ApONxL0I1K
	mr4UpId5Z755jWgx5lfmbL2Hh6keezu51o0EwnKQlkIHk0tWYVj5jxG0AyBinIcBRD3L18gGDVVrT
	8tpRHa3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2bPI-003KU5-05;
	Fri, 26 May 2023 17:39:16 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2bPE-003KPW-1C;
	Fri, 26 May 2023 17:39:13 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-96f99222e80so229063066b.1;
        Fri, 26 May 2023 10:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685122737; x=1687714737;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PTiLq4ygH0IvGpIu6yVKyZxG0Q1NzCebyg9n2MhnoWM=;
        b=bwvKFcmzuCcjiY8UjRyGDFyDfiRO4TxeBvS+aOYa/Krvw0DQQ/A/QAR7XfbpE2cr59
         cdDJlv9ERgQfVXA9QhbbHL7q11EMuj8eGZfNQz6+unf2MmVUBykymvQ4jE35p1jis4di
         +GVUtSXRjAxgLjv2rvLHOKDI7VLjva6g1V4ILoYIpkzmvzLSYQTZVSlRPA9t7ylHrwNu
         /d1r48lydgy64JZFUD5VDP2vAIhxZ3/+lbZlV9LNAsX692/FlVXD6vZYfWFtbJhZryzl
         34RJYBCxsW20gJlsdowmvZYLdwDrnqRXBQwU2wBJVEyf31gEJDLeVyYTk9VnNER+lHKn
         2WTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685122737; x=1687714737;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PTiLq4ygH0IvGpIu6yVKyZxG0Q1NzCebyg9n2MhnoWM=;
        b=BKhO9JCS23dt0NGDiuQxKSK6RIeO7cwojZUfL8y945nmmgJGha9FN1092ZjRjbcWRx
         DBu5h7v/MQTrd0gWO13ZPreWfmEP02WnuCxJFEJQ34LN4DeS4JFyh4GGI5FioZvnxJs3
         HMAtnnHhx7RpdmpzgNdn16GABtGiVmv3kKQXYruTZkaew3cS9lYYyfePOyGowuDoewoD
         B3Yp5jpEo7Nb34wKcDnK3T3QkvjZHzClQPJf6SLq3XHHMBofUZiSCaMD6H2oLokx9Cr5
         pna4ag72FfXY/j01rvbCAPx3x+biSBqvgmq13bgcQN/dcr051sc/4dnCrwyq5pqQwPh/
         qZYw==
X-Gm-Message-State: AC+VfDyIlfEjS9472/rKWGEH8t1sQx5i9oPn0AnTTLpm7RNfag3RyCNK
	dQ6v+z7uWH21mbkdc2v+cGo=
X-Google-Smtp-Source: ACHHUZ4PFyKyc2QUHAnlcpOFn+49tIH6s0K2Tb/i0az8Bqph4zclDagFl+Zci851eE1HSGF8K9cw0w==
X-Received: by 2002:a17:907:3603:b0:969:c354:7d9a with SMTP id bk3-20020a170907360300b00969c3547d9amr4363175ejc.12.1685122737125;
        Fri, 26 May 2023 10:38:57 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id z9-20020a1709060f0900b0094e1344ddfdsm2394951eji.34.2023.05.26.10.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 10:38:56 -0700 (PDT)
Date: Fri, 26 May 2023 20:38:54 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: arinc9.unal@gmail.com
Subject: Re: [PATCH net-next 30/30] MAINTAINERS: add me as maintainer of
 MEDIATEK SWITCH DRIVER
Message-ID: <20230526173854.ubaz2yojpt6k6rxj@skbuf>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-31-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230522121532.86610-31-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_103912_416004_1857B404 
X-CRM114-Status: UNSURE (   8.87  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, May 22, 2023 at 03:15:32PM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Add me as a maintainer of the MediaTek MT7530 DSA subdriver.
> 
> List maintainers in alphabetical order by first name.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---

Well, I suppose we need more active people maintaining this driver, so yeah:

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

