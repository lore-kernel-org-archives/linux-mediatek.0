Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 303A4E8FDC4
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Oct 2023 01:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LtgXwyXGb2bi1jhVkZotMHTKIP1cWrsqyGVuQzeEo2I=; b=eGdwETtk3UQ2rrDs8/n0/dhIbv
	8c0Qn+IpyFK0mTuf9G6OvFmwAzsDm99TcA7U+AY2s7XKmr+f33/8gPsjvMVy1pp3LH5Y5QLHxzAwb
	xCuB8afMgIZOr86NbhiytoEERYS/ApSqW/H9dsYTo/YGaoe0b3zIMtw6lDyU6TNmbhjNhTXF3uJh1
	/cuJt5T5eOuH7bMUEEWmWb0+eUhXGqk3TP1ipil8mOUaVzxXKdhUnbu77waCBUSuXauXC/oIEqEJm
	ElmxkgkwWXUAFa9SUp0OabyM0/eIO4cEKROjD6iqGV2Lw+yoXOlm0m9Ohe3SKg1ilwVd/XmU7YsrH
	bD07j7Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnqk3-00FjBU-2L;
	Wed, 04 Oct 2023 01:31:59 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnqk0-00FjAL-3A
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Oct 2023 01:31:58 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2c00e1d4c08so17892891fa.3
        for <linux-mediatek@lists.infradead.org>; Tue, 03 Oct 2023 18:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696383112; x=1696987912; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LtgXwyXGb2bi1jhVkZotMHTKIP1cWrsqyGVuQzeEo2I=;
        b=Sns+I/Ww544knlGHszYGpSTYzgYQM5dOwtrNVB82OgovhmtNrTvl+o+5tMjtk1RhCK
         yPkVQMM9MPl1AP/NUIo+pvnaXMDEzZxZCttYHBarxrqedDex4ihOZq1gr4MQgICDWzUY
         GanSTYKjZ8xYOolHf/1GOteAaTuLn79Im5lk1vjT7xOpBSHbzf7jyE3rQzcX/EW9Bo65
         LvDwGFGupY4Wk/Bb+Ob/3Qo/PZMMxrhxexSF4y6HHpcRdk9Zoo5tVnOllr6iTfEuYu9u
         7Xr53crRfoIAJhyzNKNZgUenMeQsGL8MUxm6c/RUOLMAvTR+WVu402ugwhqaYXRt08PO
         qEHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696383112; x=1696987912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LtgXwyXGb2bi1jhVkZotMHTKIP1cWrsqyGVuQzeEo2I=;
        b=pgwiDdWUjxqbJpE/DUx0aggLG1yv2NzbEOor6EZ8BC3+WWeCEY92jE1PxFXLZjLXwE
         7Gwc5d/3JqEnpfTAS6XkacMNl8uFXlV3l0W15szcrKtWFBACrxFD6rMQTaCEvwl953Iv
         AqreBqZfCCHNKhriM2yNy8EDorR6/YoSCFSZXzVk5Smj0m8LYzWox72os8SzKS0er/j1
         X7TfiDhkOexnK986wW42AEf8c2anPqECsylKWi/owf+7/hY7dyXpUMThMlgA3LO1MwsK
         c693knwl/DP+O1wUY6pt5gijTTv0IzG1rOOvUZzuaaN61doJxLTUQyTLbNSYathZepaS
         fA/g==
X-Gm-Message-State: AOJu0YycaXBU0zGALwXhpbayQlPE7caumpstw5ZRSOfobyNQ6J7prObt
	VDrj2c092es/8vJyzD1AOqbbkrIAyp7spxMKMQ==
X-Google-Smtp-Source: AGHT+IGMEx30pecyH5eeOV8Fty5foMoStxfIj8LgwrA4eKoEVBRS2moxsuXLaNu/rZsEb1P8LuaTwT8pqmVF9UoUwp4=
X-Received: by 2002:a2e:8507:0:b0:2bc:feb6:6da4 with SMTP id
 j7-20020a2e8507000000b002bcfeb66da4mr782282lji.33.1696383111909; Tue, 03 Oct
 2023 18:31:51 -0700 (PDT)
MIME-Version: 1.0
References: <20231003022002.25578-1-peter.wang@mediatek.com>
In-Reply-To: <20231003022002.25578-1-peter.wang@mediatek.com>
From: Stanley Chu <chu.stanley@gmail.com>
Date: Wed, 4 Oct 2023 09:31:40 +0800
Message-ID: <CAGaU9a84pAWG83EVjAJxZsvDW8T8d+UyJuHXKP3XbKQwkkZjdw@mail.gmail.com>
Subject: Re: [PATCH v2] ufs: core: correct clear tm error log
To: peter.wang@mediatek.com
Cc: stanley.chu@mediatek.com, linux-scsi@vger.kernel.org, 
	martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com, 
	jejb@linux.ibm.com, wsd_upstream@mediatek.com, 
	linux-mediatek@lists.infradead.org, chun-hung.wu@mediatek.com, 
	alice.chao@mediatek.com, cc.chou@mediatek.com, chaotian.jing@mediatek.com, 
	jiajie.hao@mediatek.com, powen.kao@mediatek.com, qilin.tan@mediatek.com, 
	lin.gui@mediatek.com, tun-yu.yu@mediatek.com, eddie.huang@mediatek.com, 
	naomi.chu@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_183157_021155_F666A3F5 
X-CRM114-Status: UNSURE (   6.80  )
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

On Tue, Oct 3, 2023 at 10:20=E2=80=AFAM <peter.wang@mediatek.com> wrote:
>
> From: Peter Wang <peter.wang@mediatek.com>
>
> The clear tm function error log is inverted.
>
> Fixes: 4693fad7d6d4 ("scsi: ufs: core: Log error handler activity")
> Signed-off-by: Peter Wang <peter.wang@mediatek.com>

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>

