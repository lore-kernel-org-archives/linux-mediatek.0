Return-Path: <SRS0=Kazo=DH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F268C4727F
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 08:54:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C74BF20709
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 08:54:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C9yKg2qm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qrofEe4M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C74BF20709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JoNuQAUBQzlAx6PNbk1eDQers79woBOQPXBcchou2VI=; b=C9yKg2qm8IuVM5FUCXmnTSUTp
	746D78G3nPkrf3xsE1onGRfAc27TYD2peL32CuwfMFKZ9cOvN7YfmEX8lpNFIcub3t/dTff8+MbAu
	QmU9svvmlC7aNDAnTDexr3a+PY99HthWhiOpRO39h6dxdX/tMlZ/RNBOjuYLsiOuLWwJbkfnTnqP9
	Cdr+i0dLOGp+Ko3QJ7Gu1JzhlTpXwY80MgJrSorv+/71yOiXYrYCnU/zBDZAtdDIKZCFm92Z1DLzR
	ZRi8j1wBxabG/MHul0hqnLvfrkYyn4dYK2Bw6XBxoL9y3eOKUdKQJRlACNa0+Ccj8cwGybLj9yDGv
	i2zW00Z+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNXs7-0001qq-N5; Wed, 30 Sep 2020 08:53:59 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNXs0-0001ny-7B
 for linux-mediatek@lists.infradead.org; Wed, 30 Sep 2020 08:53:53 +0000
Received: by mail-lf1-x143.google.com with SMTP id b12so1162302lfp.9
 for <linux-mediatek@lists.infradead.org>; Wed, 30 Sep 2020 01:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3z2xOif8bgrl4CXIfjrJIpR+vLzOyA+RktpULqT3bh0=;
 b=qrofEe4M1Xd/el20IewAIFLEt4T8hUHh/n3Q1WXwOuKu3e2R4xpOQBO2TBhln5msHM
 FGsckaPK88lI2NhWKga5UDDsfC0pUTzx2a/f+Prnt/aaNJuZhYtsdIaGQtqHrWZLbDve
 +SXI2jRCFzFnFEgXOxElCgSfXePsUiP/9DJxdTyLdYPqRXZ/DzM6CeqifPWCDfe+1nfV
 3zZEYx2dgqahuhN6vaOgy9YU/cMWLAiMuTerlD6//ZqEUnP/pbg7Wwym+nxkYDjtDWlj
 RF+j/fCbtpvYLw5HK6i9V2IrpXiOlnQkmTKFRQfGNylSRab3xzsPqiypuduF8wvSsb7G
 L44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3z2xOif8bgrl4CXIfjrJIpR+vLzOyA+RktpULqT3bh0=;
 b=sV6cOK3HargEQnvqcOFhrpfPdrwuEZv0cGNghU1rCEUM3ws7OeAaC10EmC8CVwV6vo
 AxZUtKhFbzohXnIgAKOFcMt4g2qt8pdx117Zg7gwqgsHYlNN4kS6t9EiexMs8cpCqgT7
 RGupUxV+gMvSN5QgX8QjAwwrxQa4Is/uYsvfqK4sZVC8h6hK8rkGeYiKdfkBI6SUkjwA
 kNp9/GqrOegCPa1Tpu7sRutRCr+fGhBKKAgkT5QolRbNl5W8bptdlN4X/ylKvTw28i4R
 CzTLi05r/lKY/SbTAULtCD0J3qMoxpByqv8x5l+rT26YcNY+4cEItFQHQi8Z4B65jlpI
 KJ7g==
X-Gm-Message-State: AOAM5333MSxrY6b+NknX/POgGNB7XqaAT8hjClPeQd+m3Cf59zutAJi2
 ySeGZdiQB3QsLQdQ21Y5XGfFE5YDeJLQlkLFWMzENg==
X-Google-Smtp-Source: ABdhPJzi4flBuB3wmmmt9LtKMpa6PA1KfwRmboYTD0A5gCDHKZ3c33ZbcjL3MiGZbitzxdQhZsN3HZRaN/nxffefeQo=
X-Received: by 2002:a19:1c8:: with SMTP id 191mr484379lfb.585.1601456029840;
 Wed, 30 Sep 2020 01:53:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200921131056.92848-1-miaoqinglang@huawei.com>
In-Reply-To: <20200921131056.92848-1-miaoqinglang@huawei.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 30 Sep 2020 10:53:39 +0200
Message-ID: <CACRpkdZxgw7zmmWyVpxQ5N60Yxzj+u_LPAkRGN0qS3A4DqKNgw@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: mediatek: simplify the return expression
 of mtk_pinconf_bias_disable_set_rev1()
To: Qinglang Miao <miaoqinglang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_045352_315115_1D8A01E4 
X-CRM114-Status: UNSURE (   8.68  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Sean Wang <sean.wang@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Sep 21, 2020 at 3:10 PM Qinglang Miao <miaoqinglang@huawei.com> wrote:

> Simplify the return expression.
>
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>

This patch does not apply to the pinctrl "devel" branch, please
rebase and resend, include Sean's ACK.
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=devel

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
