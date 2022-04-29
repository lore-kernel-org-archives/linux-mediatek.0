Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F28EAC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 13:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NqBtzAAatjylp7BTZgXwT0ItJgWrtOqjVOfJSgqcjMM=; b=Q5OWwwBfUhfxPJ
	+qktNkYI70h9vySOW20Yy8uJ8EgfDmlxfVIybT+iIPqwNVaoewCX1ByRCDKh5RxjfbmzGAtXb7UD1
	UN3X7FYB1YfGuPU51Kk1fUyQYWpsjIucx9xmRbnsZ4LkaQxSWosvF7vNoLb1M6BXc1LaV9e/3o8IL
	ZAvHw1/gpmzrhtt2mzN+bG1r4NLwsAOJq7HbLzCMDOs5ebFVk3iLLdKmqzVm4WD9vM+ecL6i6McT9
	3j3GVXQvm5jf5t2tiel3BZn5RtTuNwljp1nd+04iRdEY6IVr/Ih8ql56xis1+jVUp8Xlts+AKi6Qu
	a7OR8/9KUhAharxbVx8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkQiy-00BNfW-O7; Fri, 29 Apr 2022 13:31:56 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkQik-00BNbG-Um; Fri, 29 Apr 2022 13:31:44 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 4CA7F1F4658D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651239099;
 bh=uvUnG6SlX1gGcWQAJOz8DPjd6t96tfmGQyIl0sM6fu4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RXuBOWXMODTLX89Onn14gvnX//JsqGDiXZ0epAVc3+VtKm5AZ3J9XLRo96qvV6lCm
 0KvhB7qlRkRyR4YxcEe5X/NKjj2kj2WH8mS4wQ1fmQN+B8VygH+D97VHfWBjAq2lqc
 nu+nQkqL61QEYW+5cPOkIGmi2GyorxakBtjzYB89+nacx0b3meTUfbzd/ZMUpSNR9a
 L2mWvHOCa9jHqsZ0eedgyXDCt7HHA7N8JlGj/rbzTG2gqtBrVlaGh2+2DBbReM71az
 gmLUGtgtnOz3eldKXKz5a6dqOhXuCAOvqKvQVekasGwmC4SSHETrdljN/l6+VeWamj
 q4sJ/EQ962UXw==
Message-ID: <6c99b872-6092-4271-467c-788a781110a4@collabora.com>
Date: Fri, 29 Apr 2022 15:31:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] dt-bindings: ARM: Mediatek: Remove msdc binding of
 MT8192 clock
Content-Language: en-US
To: matthias.bgg@kernel.org, mturquette@baylibre.com, sboyd@kernel.org
Cc: allen-kh.cheng@mediatek.com, weiyi.lu@mediatek.com,
 chun-jie.chen@mediatek.com, linux-kernel@vger.kernel.org, ikjn@chromium.org,
 miles.chen@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org
References: <20220429123133.28869-1-matthias.bgg@kernel.org>
 <20220429123133.28869-2-matthias.bgg@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220429123133.28869-2-matthias.bgg@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_063143_195937_51B34690 
X-CRM114-Status: UNSURE (   6.71  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 29/04/22 14:31, matthias.bgg@kernel.org ha scritto:
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> The msdc gate is part of the MMC driver. Delete the binding description
> of this node.
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
