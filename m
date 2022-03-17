Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CEEC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Mar 2022 01:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X8g6r/GuDgPCB+VwQPTCYtj7Gs/vpKG9zdk9kcAy4Lc=; b=KtKjZeXrcVPBEU
	D9naqmTkTa/UMBwLUy4wUnzIPRPg4idmxUVPUI6AeU6pqKq3OYja0JoJoEU9qVRVdLuDV0ZY4c8wo
	bVCgN9+9pSiSHvxlGcBvd7nlzsOTuRPyuBiZ6onI9Yb5VGdwM8Wo/UcWjaVXrFnbRHdpJnGz5p+7w
	Deowrnt0iY5s8DGDAOgoTyUj5UhFE4MeSKCjMRvoP9qctwbRfmOy2ZLCcIMMac7JJvxHTkV7un20Z
	6ueR1x0iWV1sNj8GLiAIryE93Z38tLOItl0Zr4bkBFaA17VxMvVH7vScSnyqdP9AobqsjxJLrPrKZ
	IKLA3xpEgTUxkWpncP8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUecg-00EcbY-Bu; Thu, 17 Mar 2022 01:08:14 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUecV-00EcZy-D7
 for linux-mediatek@lists.infradead.org; Thu, 17 Mar 2022 01:08:04 +0000
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2e592e700acso42637247b3.5
 for <linux-mediatek@lists.infradead.org>; Wed, 16 Mar 2022 18:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2tFRxT0rhwghQI8gEvi47agtg8vGan10MotjOAuSr6Q=;
 b=UJOX6oklTwkW8w72dCmc8m8zhGfK8OpqY0/JVXhh45Qf9zajdUvJ14OecbKjeXTDIs
 OM3lvFrvqyTnAzZVECEKF6QZ3diKcgggyF082T/v7AtjkiOrjGQhVeFx9jGG4FaZMKo2
 /ym8+gOqDqEiR8ZDRXt8IjN/mjety+rHghP+oqxFfyGl4gpfTgfKTSOUhStMHJ2oTh0O
 ULFgNodNSUChULDs2nHrd6T0fE9xmpCMcP6oQUhbdTx/SBsul0rXyl9MMmaGVMrywVky
 vj+2LH5h7FeYGb38x/w1Qf0qKpcDpoaigVkx0OwS/uBcEaqr+kdfCutCk5cHI4FhCj3v
 unoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2tFRxT0rhwghQI8gEvi47agtg8vGan10MotjOAuSr6Q=;
 b=q4ViGMoNhII2jL68ZV38PK0iFHad7HypqcyqwH6Xsh2yRwk7G8o0ovl+43non/RyUU
 DNtQVr6qx4aVevLh4zrmfTT743UyX9ZSGozggPXKO31H3d90V/ChuQdRSps9r51e3jzW
 dnyBPS9q2xAmRZpcSzg9CyjhR4+9whHbCN44l+xS43g85ClvHMc56nhMlWME+u2uRfdN
 Mj5vepAyIIZm5JuLZwAQMam4uxZHHnpdI5a4bj3Qt7FkeIM/ReTPvSK2N7RSS5RSItZk
 EJK4n/K4du6BYwKi97Belg5wIo2108yvFS3FpuyCK9wJekn66bGOekf3Dq/uPsj5V4M/
 d/Yw==
X-Gm-Message-State: AOAM533JkgZ1dXou3M/f9yQN2MLERnqzZkVMMYrDEox0oaPVs8E+cswT
 JlPB6UkG0jC1LHLzfGQkAi+DaLDq0NYsw4VuFqT5VA==
X-Google-Smtp-Source: ABdhPJyLzDO8+2Z9/Iy26d888RjB5pB/JHSL2FsWcJtTJ3c4CwGNFG7hfFkA0IlkcXmr/Z6sEsDLQrOFpMY4U3ojLsM=
X-Received: by 2002:a05:690c:9b:b0:2e4:da22:2a71 with SMTP id
 be27-20020a05690c009b00b002e4da222a71mr3697904ywb.126.1647479274986; Wed, 16
 Mar 2022 18:07:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220222111144.20796-1-angelogioacchino.delregno@collabora.com>
 <a06003ae-2dcc-f5a4-3b5c-62db99d18950@collabora.com>
In-Reply-To: <a06003ae-2dcc-f5a4-3b5c-62db99d18950@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Mar 2022 02:07:43 +0100
Message-ID: <CACRpkdZnz9ry74mGZ-SvxvVt0NOZMpjGVL3KayK+xRXgRKSQPg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] MediaTek pinctrl drivers cleanups
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sean.wang@kernel.org, matthias.bgg@gmail.com, 
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com, wenst@chromium.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_180803_479482_4D1F8CE1 
X-CRM114-Status: UNSURE (   6.24  )
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

On Wed, Mar 16, 2022 at 11:57 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:

> Hello maintainers,
>
> friendly ping for this series that already got a Reviewed-by tag on all patches :)

Patches applied!

Sorry for missing them in yesterdays batch.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
