Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC7DC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jun 2022 09:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tAL3lXweinEELIf08QoRxAIjkevmw4vPAuyAnzWvcoI=; b=dYMyCuvwf3Av2b
	WiCqNug8hb+slnimkqWIQeAG0MrDgltilRjH8j98N192aCErsRvhT+YpqOsZPHqcsaF/v2cAekaZJ
	t1+jdqgjMgxxRxNNFMMdNNQPHlKektQi19e1YHNlZqRQCtPdDg4ZnlloV+MQjH4w1Sk9cW4ku1I1p
	TiA0r58T7AMzqz7b+uYKlNft8hu4yY985YxyAJSqvmFasbd7HytfY0T1ya9taZGcdSS8NZjlmns7A
	rQfhEhKg+212wyTU2DhZbnZa8v9aIv+8IOMi8IhMyIYCmMdka/pf7IwBS4Y9vxeh29ZsAcY6JMiEg
	98iT69mnqHOVEik0g6ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzxZz-00CIRP-88; Sat, 11 Jun 2022 09:38:51 +0000
Received: from conssluserg-04.nifty.com ([210.131.2.83])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzxZm-00CIMk-3a; Sat, 11 Jun 2022 09:38:40 +0000
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50]) (authenticated)
	by conssluserg-04.nifty.com with ESMTP id 25B9cJBC004953;
	Sat, 11 Jun 2022 18:38:20 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 25B9cJBC004953
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1654940300;
	bh=dvQLqE9CD0Sc31TfKaAdiORJwqPYnVIClrdVtOr8MuU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VQRRIgL3RaBwbAb8zlsjU/+y8z7S4bPBtkzV2F3eoVaSN2nqeiiouM3JjXiSZwPif
	 QrU11WA67/+x5QVZKqO8abfFxTxi9/K0zSLaujSd+f0t9XdHrKR/d7soaLwqc9mtUl
	 zNc9BaGaqIYr6DKiwp2p/YpKKy0QHEPfqfnbod0wI16QgGPIr6geIpNmJFNSoFKuZM
	 DjMhbcVfKcy+XPHyM64ao1YZQDhOzSRP+h36+NzP1yHrB8i30j94oXxeWyIeWGCkDK
	 hsQrBwU71+Mpny5s4+LmQyQCQ9CwvHcxbq557kQmVmb1FWMcQJuNpv5LAdwyOPmXqu
	 a9b28AwXa41qA==
X-Nifty-SrcIP: [209.85.128.50]
Received: by mail-wm1-f50.google.com with SMTP id l2-20020a05600c4f0200b0039c55c50482so2219814wmq.0;
        Sat, 11 Jun 2022 02:38:19 -0700 (PDT)
X-Gm-Message-State: AOAM5316sSd7Mi1Qr3SZ5k67/uM7eDaK7o5HmnDpcu5C/9tigDLwHxSh
	zT4n/MKZh/Rmi3ZCAdaOZhYnWYy5FnTYlZj8y94=
X-Google-Smtp-Source: ABdhPJzZVNw7ql3vh1nekhMh6vBUEJO0ZE52meBw8QyxqYw1a6qL2nlFf1hcJ8FXJAo3pYzjIBY6d+gFSFhDl6mYWUo=
X-Received: by 2002:a05:600c:35c2:b0:39b:fa1f:4f38 with SMTP id
 r2-20020a05600c35c200b0039bfa1f4f38mr4083537wmq.22.1654940298310; Sat, 11 Jun
 2022 02:38:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220610071500.9656-1-Kuan-Ying.Lee@mediatek.com>
In-Reply-To: <20220610071500.9656-1-Kuan-Ying.Lee@mediatek.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 11 Jun 2022 18:37:41 +0900
X-Gmail-Original-Message-ID: <CAK7LNATknxrmnAXKkz-XzkGn1kprPiQLrjKSdp4wKCRhPczcmA@mail.gmail.com>
Message-ID: <CAK7LNATknxrmnAXKkz-XzkGn1kprPiQLrjKSdp4wKCRhPczcmA@mail.gmail.com>
Subject: Re: [PATCH] scripts/gdb: change kernel config dumping method
To: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
Cc: Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>, chinwen.chang@mediatek.com,
        nicholas.tang@mediatek.com, casper.li@mediatek.com,
        andrew.yang@mediatek.com,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220611_023838_400487_995B148C 
X-CRM114-Status: GOOD (  16.65  )
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

On Fri, Jun 10, 2022 at 4:15 PM Kuan-Ying Lee
<Kuan-Ying.Lee@mediatek.com> wrote:
>
> MAGIC_START("IKCFG_ST") and MAGIC_END("IKCFG_ED") are moved out
> from the kernel_config_data variable [1].
>
> Thus, we parse kernel_config_data directly instead of considering
> offset of MAGIC_START and MAGIC_END.
>
> [1] https://lore.kernel.org/lkml/1550108893-21226-1-git-send-email-yamada.masahiro@socionext.com/
>
> Fixes: 13610aa908dc ("kernel/configs: use .incbin directive to embed config_data.gz")
> Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>


Thanks for the fix.

Applied to linux-kbuild/fixes.




> ---
>  scripts/gdb/linux/config.py | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/gdb/linux/config.py b/scripts/gdb/linux/config.py
> index 90e1565b1967..8843ab3cbadd 100644
> --- a/scripts/gdb/linux/config.py
> +++ b/scripts/gdb/linux/config.py
> @@ -24,9 +24,9 @@ class LxConfigDump(gdb.Command):
>              filename = arg
>
>          try:
> -            py_config_ptr = gdb.parse_and_eval("kernel_config_data + 8")
> -            py_config_size = gdb.parse_and_eval(
> -                    "sizeof(kernel_config_data) - 1 - 8 * 2")
> +            py_config_ptr = gdb.parse_and_eval("&kernel_config_data")
> +            py_config_ptr_end = gdb.parse_and_eval("&kernel_config_data_end")
> +            py_config_size = py_config_ptr_end - py_config_ptr
>          except gdb.error as e:
>              raise gdb.GdbError("Can't find config, enable CONFIG_IKCONFIG?")
>
> --
> 2.18.0
>


-- 
Best Regards
Masahiro Yamada

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
