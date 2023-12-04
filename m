Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46A4C10DC1
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 09:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I/Va0kOOCQXMJr2TQKWKwJ9zWUP7bBtr/H8JK5walkU=; b=405sYVxkSDwcQKq84BL+RmFenF
	7BvLSglN7daiNs5tPxnMGKzaTByrqjO1woxM6v2JxQDM++Rg2eEULEqqI+AsoZliBVsoZNc7aS6Dl
	JbprQoY/VnfqFisaZeo0Kjr2vPSt1ZWbd70cEJJ09AD6efPG8xUcMGHg8EO/oS8KZPrnRbIG/KHnc
	LNauaVK0FnjniAuoLZIaOf8usQQpZ35eKqdVeVIE3KiYxW8+kgQbx13q4/BgLtQne9o6M1BNlXLF5
	alMMpp4P90Ap1vNEh+7cQsY8818gj4KKenwjLRN4G1bU6RCWZbnxwO7F5EykFLL++G9P+zzKVUQTR
	P2jPiiJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA5YD-003RsD-1l;
	Mon, 04 Dec 2023 09:47:41 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA5Y5-003Rok-0X
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Dec 2023 09:47:39 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-db544987c79so2612852276.2
        for <linux-mediatek@lists.infradead.org>; Mon, 04 Dec 2023 01:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701683249; x=1702288049; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/Va0kOOCQXMJr2TQKWKwJ9zWUP7bBtr/H8JK5walkU=;
        b=pu19pB2FfdJf4QmEEHcEYec+pJI7r4FyPOcvpMLWO2Rd+9FTYj3Afy5qWR5fMvA7S/
         bKxT5ASWvgQyu1VkQSQDBgLmD9oNsOQDoSn7M4FVjwQ6qzImtgRdtu04CDXu7b2c+HEe
         mbCW4haJyNiuJCCfS7SbaLhpK1YCHij4HEClYALyNi2voVeNsMu1LU8UsVL7rB4bcddB
         FP9WbrzHK5HTzRhusx8IieKuyyljK7gu/Hz0fEfOkG8aF56FGzTug9WQQG+DsccHFXHe
         hSaVAD05nEOkBqzWq6HwlXYVEG0HV/zH2kWlaVAHncXNOMQMyW5rGCkKewXict9W+uUv
         rWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701683249; x=1702288049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I/Va0kOOCQXMJr2TQKWKwJ9zWUP7bBtr/H8JK5walkU=;
        b=CAjvX8RyFHZlpjAHsy7x5pwUvqJ6v4INIFYYXPp0gIuxVt7RczPuoAy1W5u7Jr/rvJ
         QtLlq40V/a5NSYg9q7uWqjjeKIkjOR5pRE+9kyLuC//o0w3e18sY6r2tWzuLsqyLUSLQ
         uHjqiStPz935K3PJDMSiRpsjA7yS0sBhjQI7fbFATKJ/lQ425qkMJzR99Jnotf/paVwr
         4GYPjHq/TtoQYWqwmXKoDx2ejOITL1ds0PaQlCdyzuJjsj2ZLVsEvVtsoA4oGY8x4lNw
         Q/SIE61Xp4/zhCwTahHh6gXEi1tlQosiEMWORcy6TsNGikM2RjlX0a5t7/ssVeGLeuJT
         K8+g==
X-Gm-Message-State: AOJu0YzZlzBXMYgygU69k3bx02MuoZzBuvauSETiWSnYSzABwAs/4SOk
	87Nif+ZUklSo+7WAOvqWnD2RGicp0j9Z5x+RJ60ymA==
X-Google-Smtp-Source: AGHT+IHzmn4R3eDwNqxLIvsLdnuOrMgDl1kyI5pUXW4FtxkQmVJw7pplvdOzdsQmeJxtozIgo/BWo3hmtyPbnRvdWuw=
X-Received: by 2002:a25:824b:0:b0:db7:dacf:6fe4 with SMTP id
 d11-20020a25824b000000b00db7dacf6fe4mr2504494ybn.108.1701683249364; Mon, 04
 Dec 2023 01:47:29 -0800 (PST)
MIME-Version: 1.0
References: <20231122144744.2222207-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231122144744.2222207-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 4 Dec 2023 10:47:17 +0100
Message-ID: <CACRpkdZtCOwmVa7_vyCfs5i3GVdvopNAGA3rPyij0EeLr8e4MA@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] pinctrl: mediatek: Switch to use no-IRQ PM helpers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_014733_224255_6DC5C6BB 
X-CRM114-Status: UNSURE (   7.83  )
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

On Wed, Nov 22, 2023 at 3:49=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Since pm.h provides a helper for system no-IRQ PM callbacks,
> switch the driver to use it instead of open coded variant.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied!

Yours,
Linus Walleij

