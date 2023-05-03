Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CD5C77B7F
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 May 2023 11:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oH3aUxQAWY6zp/CItT1GFjrwMkuxRShVN8W5pRZ8Gfk=; b=kPWSZhAsx5HW9z3YPTwpA1mdkT
	nIAw2h/f7W4xiqn2ZW3dx0E6DlGie1ufCfYqPdxew66WiP9YueawZnX6lGiECagtuZt2cWjpZyHrk
	vWIZGOgrc3g53c/L/xgESWRF9RufopCVX4v0kzj1FV8hpHRphHUsh357LHL9EBVxyS5h95snfUqWq
	Upon6fEvRjIdadsNs3xkIcaAZVl6//vryMwbcjpVzhvyz8SoY7AWlFRYdhXNE94U4f0hLE0dc5/kD
	4o0yPNWbeCGAhVMEPPnFzZX0ZDHVgZ+xeOzIlj3ma/vevSdD+2YtIZf8pZ7Xlr1mEgyt1bmL+eujb
	vIh1zXAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puAsM-004Q90-15;
	Wed, 03 May 2023 11:42:26 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puAsJ-004Q7X-0e;
	Wed, 03 May 2023 11:42:24 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 003FA6603137;
	Wed,  3 May 2023 12:42:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1683114141;
	bh=TJaStcw6M4B58qZF10snuAZy5WmEbCUGpaBSgXcB3bU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NLpO7YpowMuvPI0VQ59s/HG7tJd0sVv1gtW3PjtHGP1OQw84duZZF5C52ptFyI9P0
	 DVOh5Ru6igE33sga3bOquYgvVmY5JhLe+Bmi0llXaAywV1hIG7hhpbWf8tFApXB0aL
	 EoSorC+WbAN7BY8hLMbf8NwYeawccQcNMemOeVpHXesOatTY5rjO4FH8W/nE+ogK8E
	 yyLJsKPT147MusXx6ytLbh/0MVqRLxN4JsHTaYUE5OsrECAHnHw7M6ydLiU/NwKb8s
	 9imBuh9oBbirxL1xVEwpzsRjoUwNmvXzXkLjUXfht6oIFeYUOHsfdofKsl9ml2haRC
	 u34rjeUXFbOlQ==
Message-ID: <417dfaa8-86a3-6cd7-d377-3cd8a7eebaac@collabora.com>
Date: Wed, 3 May 2023 13:42:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] scsi: ufs: ufs-mediatek: delete some dead code
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Stanley Chu <stanley.chu@mediatek.com>
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Andy Teng
 <andy.teng@mediatek.com>, linux-scsi@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel-janitors@vger.kernel.org
References: <68fce64f-4970-45f1-807e-6c0eecdfcdc2@kili.mountain>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <68fce64f-4970-45f1-807e-6c0eecdfcdc2@kili.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_044223_364209_D0AFECFE 
X-CRM114-Status: UNSURE (   8.48  )
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

Il 03/05/23 12:40, Dan Carpenter ha scritto:
> There is already a test for "if (val == state)" earlier so it's not
> possible here.  Delete the dead code.
> 
> Fixes: 9006e3986f66 ("scsi: ufs-mediatek: Do not gate clocks if auto-hibern8 is not entered yet")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


