Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD27EE57D5
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Sep 2023 06:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IS7APAXWLyRKAmVXEey0BMtRb06oUTAybc0N4RvhQnc=; b=HysQy7HdI+7ulW9zLkOLYixFKI
	aBYf3MSsijIjmilcC9iRCkHz4526q35T8Tl88EqsBrU0xNK8e8O3lq97HF4CyJ5OyUPcnIbGr5s0j
	FzHCXySaGqu/f6XzyQKLQPc7Kj4fenZ5GOQych58zvi0UfgQbnJ49PsUMfbyvmFzNE9EcqMmpX4wc
	+5VXzMaVLd+DHdazS8u9MW3fwZ8tJZ+b77Uz7ERP8qeNqPtP60HROByzgTfsgAMa2Za+C9cr78Eoo
	VJfpTGEcAF+Dxi4/1ck906fuRJ4wCQgVofQV0fggmIXv/NaRTZXt+7aMYcxEr6+ykLfDMRa10uNfW
	Bud1bAwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeVRl-00DCvD-0v;
	Fri, 08 Sep 2023 06:58:29 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeVRg-00DCu8-30
	for linux-mediatek@lists.infradead.org;
	Fri, 08 Sep 2023 06:58:27 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-401b3ea0656so17977265e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 07 Sep 2023 23:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694156302; x=1694761102; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IS7APAXWLyRKAmVXEey0BMtRb06oUTAybc0N4RvhQnc=;
        b=mpJC7S/ZQCkrXOq5Dq6IDy7OqFcO7+gHDw41YCwFWRwq7yFUeEb7PO53TBF8XBkoMw
         N51jhxCQxv9OT2RFxQ7NKgO1IQErefkrAhaBcFIfBetwgzboC10sKNvhybAQ6hgKSGQn
         UeaMH9wylQlDWYizFB5YNt3dfK+6BQqQYuD3Rz24uHUbfy7RFb6XPgPmFmnxKbeCEw0c
         6vpvEqpKFUFI9Oyyk522GHCEUY+nEhXgRzwbAfkKY3qfCwbagG/AD5mYCNQFqzwE6DHJ
         9BGpmTjqwwb/X6fntKawp0I0J+UW1xOa9JLAtpAOtziSej2T51itwiz/luR+ZwyXN9mG
         E8eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694156302; x=1694761102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IS7APAXWLyRKAmVXEey0BMtRb06oUTAybc0N4RvhQnc=;
        b=juJbMknAC43dSAla69w/jclbzb++9BRCRdJaXqDDF3pq2PcmnGpACguyy1lMUNX0e+
         ORVd2niwMNokICRJMna5kpM/6nuay7+4Gd+JvoC5lsio7s+EVKfym5bRWSJnIzO1Uncs
         FRpUMqAghw/4gmC8MvlUPlhOyPSP04nzkII2CGS3CyVyl7PNol7v9RSUCnK/5UeYjNmF
         B33ts5ALjAjyD+AQVC283CC9XfQ+09D9Ipi0qevhlTFpOUse9ONHMqjBpWi6OU444my1
         DnwBridbQ0lg2a7WXxY/pHr4oSX8HzX4RLCq4gwsvxjukV9q4pdi+KsAhq4tnR1DgH/Y
         5vtQ==
X-Gm-Message-State: AOJu0Yxr7v7YRFg7DNJc0P8T7nkuZJq004phq7eaHbTUb0gJ/vzpIp4X
	ftyxH8FyltBfOgibFmlsbC58AA==
X-Google-Smtp-Source: AGHT+IEZV1Q27i9G8hEK5mZxwqpxrF/pwUjpH/zY9fyCoVx23TMN0b8UA/eU3imtpk7CgnINvQq+qw==
X-Received: by 2002:a05:600c:2483:b0:401:d2cb:e6f3 with SMTP id 3-20020a05600c248300b00401d2cbe6f3mr1573418wms.1.1694156302156;
        Thu, 07 Sep 2023 23:58:22 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l23-20020a1c7917000000b003fe17901fcdsm4361670wme.32.2023.09.07.23.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 23:58:21 -0700 (PDT)
Date: Fri, 8 Sep 2023 09:58:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: fix uninitialized
 variable
Message-ID: <8a7f79be-e775-48ce-9eff-afa399e560d7@kadam.mountain>
References: <9918f1ae-5604-4bdc-a654-e0566ca77ad6@moroto.mountain>
 <51d1ae238aecde07b2b4fe02cdab0dc87287cd96.1694099183.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51d1ae238aecde07b2b4fe02cdab0dc87287cd96.1694099183.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_235824_970066_4933B33B 
X-CRM114-Status: GOOD (  10.76  )
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

On Thu, Sep 07, 2023 at 04:14:20PM +0100, Daniel Golle wrote:
> Variable dma_addr in function mtk_poll_rx can be uninitialized on
> some of the error paths. In practise this doesn't matter, even random
> data present in uninitialized stack memory can safely be used in the
> way it happens in the error path.

KMemsan can detect unintialized memory at runtime as well.  But
presumably no one runs that on production systems.

regards,
dan carpenter


