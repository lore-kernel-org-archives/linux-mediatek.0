Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BD3C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Apr 2022 13:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UVV6AFy08AdUgkWHIw9kocZ9wbdTsGaPqwoeWxYyR8I=; b=EA/eWQ0B6Njjt+
	D9QpZJ/Hkmv+dDHdh3zlUVCEE+/4oxF9MsgLdkni/NxQGnSGUojfdR4P2EX4WlTk+kpC3sSHV6KVI
	Ox/oMWuyeCC8xSmBBEtoDb+EDeYgbdXMFkOlEwbw5aQGgCsZoci+czpkXtaFVbdCZHPk7LD2/2BTV
	WOyzbsoZCOoFAEIbjq7zfrSv5W88nY5DLvIgm+TEfh9z+eKJ8ie0FysQe3VRhkDv/enXsSRy05o5q
	dr4VoYQMkrLtr2601t1jxJXSR9zgD74tKDr7ZHGVHES8yf7Rp5RDUth+wy08T7CX9or2M3XTw+p26
	ZIyulrwJlWh8yP3mx+Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbjNO-001BDA-Sd; Tue, 05 Apr 2022 13:37:42 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbjND-001BAe-LC; Tue, 05 Apr 2022 13:37:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id C01181F4512B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649165850;
 bh=plGTTyi7O6qDtXxCe+h/xQcs9ltHnMhWtxjOqkuVZDA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=c7CbAeTNu93R+wac0xUo8wYt5JHYwVPd64SEqW/SDwK8otS4ZmnyP2OT8Zetat059
 odFY4s7LLMRKdZx+u9DgJ+6R76/bmNzUrxwpPJMv+KYldaKtX0rVOinXvHBuewmHCd
 GPiHBfHg9bzOyApLYuAlAGJ54YI1ZvRFGvvu31CzQMNaPh7/FpmEf6WgCoWWVghk0v
 n7+V4pbW+bbDbiuVhQ74MTamguMKsNtXVYQJBaVZkV4tM1g6haDmp3nJBTJhcq+6me
 SGNpIoCdUfJATVmysl7Ianu9MVm7k8Y6RobJ0fX1h6SE+SehjaHHxv8XRMMnf90Yif
 lU13kvmJsV8CA==
Message-ID: <9999f731-1e95-ef51-4b09-c88222320696@collabora.com>
Date: Tue, 5 Apr 2022 15:37:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] remoteproc: mtk_scp: Fix a potential double free
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <1d15923b4ffb94531435c48482fef276a11b9a67.1648981531.git.christophe.jaillet@wanadoo.fr>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1d15923b4ffb94531435c48482fef276a11b9a67.1648981531.git.christophe.jaillet@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_063731_867044_603601CF 
X-CRM114-Status: UNSURE (   8.37  )
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

Il 03/04/22 12:25, Christophe JAILLET ha scritto:
> 'scp->rproc' is allocated using devm_rproc_alloc(), so there is no need
> to free it explicitly in the remove function.
> 
> Fixes: c1407ac1099a ("remoteproc: mtk_scp: Use devm variant of rproc_alloc()")

Hello Cristophe,
thanks for the patch!

I agree with what you're doing here, but you forgot to add your Signed-off-by.
Please resend it with your signoff, then I will give you my R-b.
Also, please make sure to add me to the Ccs so that I can see your v2 sooner!

Thanks,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
