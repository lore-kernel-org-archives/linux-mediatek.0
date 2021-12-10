Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F742C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 07:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KJ08GMjTvIv6rcilWyh3N+/X65B81t68v21uwccNIh0=; b=dZgPtsIwUolnMP
	KdRFlzt4gC9Vue3OLdGHdln3Mgt9CbZRRXxEnan5C7PSJLcYN13tMhYXExoB/PZvRXnZbmho7rdSV
	3xgnrQsurfAjGtSNjw1zjfRQiuphACrfsGMLX0YWuPQE3Awpbyk0MdtxolwaPMXxEysP/ELXsKAg4
	gSB9mX8JX0YGCU1W3pk+60VrAfq9WDjR9pmipB2V3lXOIFktjgpObANv5mwL6YFpxWL5HhQmICaYx
	VbLup40ZWsrNUk0/hTcIFOlonv02+9DpJZP2m7xnUCkhjxuxLP4ltV1leF0rfkK08gPGUUDOdh0S5
	WpCi/O45a8S9eJe82BPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvaj2-00175e-Ic; Fri, 10 Dec 2021 07:53:52 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvaiz-00173u-O8
 for linux-mediatek@lists.infradead.org; Fri, 10 Dec 2021 07:53:50 +0000
Received: by mail-pg1-x52e.google.com with SMTP id m24so7362290pgn.7
 for <linux-mediatek@lists.infradead.org>; Thu, 09 Dec 2021 23:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mJmmV17V4GqEpcKpliLXYPaRRnl952JuoJAtDoU5wX8=;
 b=KpGsh35qG074zspucC5/tttr2xImfhgK6xeclO/jIK+uh8oGcuMlU0gctYClhQsyR6
 RHkQne0c7wtceo51mXJZoVZhv55fcYG2K5cXhK51LJc5GBELhcCkkIVftmGwuE3TAG/4
 nWxmgi66cLT6ngZ18NHZLTg9N8Hn7Jtj9ShR8YLPSivpRzpNAHnpymDR1SpdnPGbl/4+
 mYlh5RrAnebcAYHdqGU7kZwCuA4pdlb1+fbpK0hLBzdnlp/w89dI/sNq/9YtJ4tkvksL
 PXHvjva3lYtxFm3lL4vBlpS+SPzyG7VCDqR8k19wrbo3aIUkmgz70YUhaGnwCPxwMyf9
 Yjvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mJmmV17V4GqEpcKpliLXYPaRRnl952JuoJAtDoU5wX8=;
 b=HXyjFL+U1prSh97c/wFGEpEnEtnhrZaoQPhj6cTXd4J1QMAYjJlzItxxlkPU4HNhgS
 VyIGTz7qDi0Y83oyTkI8+l3qNacFoV5+JJ2cU6r45zJmmlQaoErlRPDL3c2VXOwtPvNA
 5AkhdYF00MCbmp70EvzD9dav9DESWa3xsKfxYpjoY5BmbeS1LTRjo9MJomYnaqenJeaK
 S7ujMSvNNAWVjL8VdCUKvepHtAbqXJCMQLJFKOwEoWwhkv8TGy7BGw/BlGUTgt7FRptL
 QmbvdZfCaqpFI7Z0MxLej2NQzk7lCpXes9vIsAESBqD8yivXzWGGGe9kdbmG5oHFHXyJ
 GgCw==
X-Gm-Message-State: AOAM5308J2ZAXroJxlw7CC1BDUsnVALnSz5Nf3P12lrEFtrz+QAMRVkP
 zUse9AV1IJR2qzDt/PHjxfKzIw==
X-Google-Smtp-Source: ABdhPJyFZ5NC0bEPoezW7x/sYUWkU2IvA/4QqqzZpR7AeY1ioHFOCiUytzlpI/kl0W13hFp9IqqMiw==
X-Received: by 2002:a63:d354:: with SMTP id u20mr38051850pgi.366.1639122822857; 
 Thu, 09 Dec 2021 23:53:42 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:7fdb:7edf:3c09:a8eb])
 by smtp.gmail.com with ESMTPSA id m6sm1446947pfh.87.2021.12.09.23.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:53:42 -0800 (PST)
Date: Fri, 10 Dec 2021 15:53:38 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, nancy.lin@mediatek.com,
 singo.chang@mediatek.com
Subject: Re: [PATCH] mailbox: add control_by_sw for mt8195
Message-ID: <YbMHgkG/MwKNu0v1@google.com>
References: <20211210061138.9943-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211210061138.9943-1-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_235349_811825_3252C4D7 
X-CRM114-Status: UNSURE (   9.10  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Dec 10, 2021 at 02:11:38PM +0800, jason-jh.lin wrote:
> To make sure the GCE request signal to SPM is not trigger by
> other HW modules and cause suspend premature wake.
> 
> Set 0x7 (the bit 0~2 as 1) to GCE_GCTL_VALUE, to configure the
> request signal control by SW and release the request to SPM.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
