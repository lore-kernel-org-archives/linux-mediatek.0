Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D118EC05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Feb 2023 07:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oid+aqBdw4K3Kog+gaRMquz6ngOAq47AZPlR5mwS954=; b=QeC/EHR1YJiFj2gpW9rbuUHiWm
	ji6exs9TBz6GjhK+5VM0OyFsyQ2UUdjcC6fpOOgd22wQHNd13uKquQkr5hdsqwQHl7Y8XY5YEp3xY
	R9h6xczIrjuTA1pl+Zp/Fmn5k0mA9Q3LlquCLIhuToUph1qQcgmHWzaMQ8Y583fU+24CNmtg+dqvy
	05qxug7sIJ8jw7VddKiic8ESN4krpc3rER7mvDaOvd8mIu9AG1iVZgOGfWm25WuKVxhjpTjq8MbFf
	S4FsSHe4qevArIk2g8gq36VxiO2BDYOKjdWY6Ubkd5yD6FS5S2LommFSB0C7CWcK+gbWNCt9X/h5E
	lthY80Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSv8e-00D4uD-EQ; Fri, 17 Feb 2023 07:26:36 +0000
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSv8b-00D4rB-41
	for linux-mediatek@lists.infradead.org; Fri, 17 Feb 2023 07:26:35 +0000
Received: by mail-vk1-xa32.google.com with SMTP id f17so2647596vkm.2
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Feb 2023 23:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Oid+aqBdw4K3Kog+gaRMquz6ngOAq47AZPlR5mwS954=;
        b=Wpiq1msOSALxHslmO5r4oAi5zGjFqDjan08pBLo60zasY1WA4ImnzmVgS32qHyY4LO
         FPqD22dSQlVp3GZnwcZx7aN5DffRJAYFAubMxsYv9B9vQYi+EC4vY9QfF8uomzhVj5I6
         Np6kJyIIsRiDL/deUDh45nl6oRFARfEIdEHpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oid+aqBdw4K3Kog+gaRMquz6ngOAq47AZPlR5mwS954=;
        b=tdVjhR2TzF1BGeaxnF3hPtlRWyi6/bdeOcluyCgODTl0OLmW1+FoxcYwBMgH6qtZrW
         laQ7qfTJ9UIju7aHiKqTayEBLzGDQ5J1no/VyoW5JjiLEDu5VTtpCzpdgrSGKa3N5uEr
         l53DFYbAvr807eSSxZjxCb+H9/y3WIqsxUjmZDoFXP7qFtMNc0CsNS7OK7UaTomAkKxs
         yEViwyEMYUAu7XRunbMpqt9e+ax/wHvSoM/urBC5r84tr98g/qG5S+Ac8RprwICo9KWQ
         6jG4aPKuzRfQe+NFuHrUFJ6MDBsZkfDx9WbEX6LpHeBRd3tVooQQLUebWC3GckKy8w2N
         40ew==
X-Gm-Message-State: AO0yUKW98dxox/vZINI+40arOHTJJ9bK0sYesrC1zXExKpKBEfI2dhiW
	4Y0TgU0yhznzG9RLuuaEQeZSX9cNyqfYgF3r0gqV5g==
X-Google-Smtp-Source: AK7set/dFOe+XmErTLWHyjvHjFKkrqaDezsomGj7d6EevRFgpJETrmfHwbshsqCN3BM9nIRDuhKixQ94pBVr0vBQtmo=
X-Received: by 2002:a1f:a447:0:b0:3e8:66ce:a639 with SMTP id
 n68-20020a1fa447000000b003e866cea639mr1392918vke.2.1676618787321; Thu, 16 Feb
 2023 23:26:27 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-43-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-43-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 17 Feb 2023 15:26:16 +0800
Message-ID: <CAGXv+5Eh_4RXN+uvG0Cwq+GkJ7mYdhtGz04MMNDnXVU13BRdMg@mail.gmail.com>
Subject: Re: [PATCH v2 42/47] clk: mediatek: Allow building most MT6765 clock
 drivers as modules
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com, 
	msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com, 
	yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com, 
	sean.wang@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_232633_175378_A43CFCEC 
X-CRM114-Status: UNSURE (   7.16  )
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

On Tue, Feb 14, 2023 at 9:42 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Most of the MT6765 clock drivers can be built as modules: change them
> to tristate to allow that.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

