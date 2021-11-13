Return-Path: <SRS0=uv63=QA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 780D3C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Nov 2021 16:35:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 370AE60EE7
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Nov 2021 16:35:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 370AE60EE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dZEVz4zNksm+PEHu1CFMWevarDTShJ2AHCNRQ4BPgWE=; b=pmqPu/h68lFTll
	qiC3wPaqXJpk9i6vZ3JZq8/vERlyB7PgR1HbMjk+36y2ZAr6BeFUJFywMYEReWa0mLqKtFPhk1Jfh
	INXWpZO9HP6H/Km5kX3ZpT733Ls8o9ltUohFF+AwnU0NVD3VcFgZgFU/YzjkUlH0FJiQm+YXG/HAP
	PNY0WrqKMBc8xFMQhrnqI+qPJ8r+o0N1AVyg9YzHQINy1mA3TNBLmXRN0qD7qwF/tqA0Q3/1gKfBn
	eCkCg3lSbhR8yh5TOvLGJt46pOCq7UVDhN2mVceg5BiY+B97wwu8qHp90qp22C1t7ksZ3BtdhVHrG
	mUCDktabHWyRDKRz8kWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlvzX-00CsvV-JA; Sat, 13 Nov 2021 16:34:59 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlvzL-00CstE-Kk; Sat, 13 Nov 2021 16:34:48 +0000
Received: by mail-ot1-x32e.google.com with SMTP id
 a23-20020a9d4717000000b0056c15d6d0caso11953349otf.12; 
 Sat, 13 Nov 2021 08:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Xs95fLVJUY3C0IFeTkqDcpFuWgNY0YQGMTpxIUpLmLg=;
 b=m4gGM+sXRQARkbZ2e1u4jvRUD4gRb49E8MGcGgNbVBh9BesBxL/sboNaLQhPaRcPRD
 ibW56sg1uFIGxEHVxCjZ4XHHxKI/yVBWMmGnaV05gwfPckxeLfZ2S8j8yEmE7zRhXvC/
 qbOKrc1t5TYEpmhZiTvyfQuquKMhbAfD4aWmrwzPpSlFSk/pT1n9CcIV65U31wuGqjYP
 ejgKGVupnOTm3WTKbGPE1IgweS+cq8ufkfVLSOoQBvj/2mUGG4JcZ7KqeqiSkCPaWkcR
 gfsD2xodza45L8B+KXhi0HF2X+wv4uUgHzGdH+RFpOuHO4XESD27zWO8T6JT/HUvuFoD
 AWOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Xs95fLVJUY3C0IFeTkqDcpFuWgNY0YQGMTpxIUpLmLg=;
 b=UxRJplyd+vyVC8NL9AAGbYg90J10P+dEkmcpWim0qO9L1aYV26N6VzFneSkcncirr+
 5Cu+4T0tm4Bez94zHvOcbxulXLMUzgGucGBiDjC3mxu1U93p7Zbrpy6Ud7ocxD/XYk0o
 xOTlkzC0I7TrRJwecRXzycFMXfIKILwsmwpdeQty2VhWBqTtgH6e1x3H6SoolYE+rgB+
 knXe7oDTzVIr8Sn3gKMmTrMtgzGp4o7EviC0AjcNh0nEaPsmpZG1rVXP8U3bsivtDSwm
 4tr2SrtZemSWSkYmqXAijeERFmWB2hSiKK4N5Vr7j7GZhdpt8Xb272tjCmCtqQlmz4qg
 kedQ==
X-Gm-Message-State: AOAM530yPOBBm2G9iSfc/tIczz3abds2Zr/hXy7DNHv+ksX+ohsohssQ
 gudBC5gT0A/FXvJVXYQXyV0=
X-Google-Smtp-Source: ABdhPJwditGxKVOEK4CG2QnPnEjJjGEO9l0ypPWMpFFnRKeOH4Q2YTupHDhplGfYSR8GlwevHfzW+w==
X-Received: by 2002:a9d:6394:: with SMTP id w20mr19793428otk.248.1636821284987; 
 Sat, 13 Nov 2021 08:34:44 -0800 (PST)
Received: from [172.16.0.2] ([8.48.134.30])
 by smtp.googlemail.com with ESMTPSA id y28sm2058931oix.57.2021.11.13.08.34.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Nov 2021 08:34:44 -0800 (PST)
Message-ID: <de051ecb-0efe-27e2-217c-60a502f4415f@gmail.com>
Date: Sat, 13 Nov 2021 09:34:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH net-next] ipv6: don't generate link-local addr in random
 or privacy mode
Content-Language: en-US
To: Rocco Yue <rocco.yue@mediatek.com>, "David S . Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Hideaki YOSHIFUJI
 <yoshfuji@linux-ipv6.org>, David Ahern <dsahern@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Rocco.Yue@gmail.com, chao.song@mediatek.com, zhuoliang.zhang@mediatek.com
References: <20211109065526.16772-1-rocco.yue@mediatek.com>
 <20211113084636.11685-1-rocco.yue@mediatek.com>
From: David Ahern <dsahern@gmail.com>
In-Reply-To: <20211113084636.11685-1-rocco.yue@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211113_083447_728275_2FCF4180 
X-CRM114-Status: UNSURE (   9.06  )
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

On 11/13/21 1:46 AM, Rocco Yue wrote:
> 
> Gentle ping on this patch. :-)
> 

you sent the patch in the merge window; I believe it has been dropped
from patchworks.

Also, you did not add v2 (or whatever version this is) with a summary of
changes between all versions, and you did not cc all the people who
responded to previous versions.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
