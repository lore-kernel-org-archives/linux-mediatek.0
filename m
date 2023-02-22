Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D93C61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 03:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zNaFMBMYjszLIMNwm9nfdvrGjZqm6B4tt+On23nJyTc=; b=uA1SEhX3QxKekQeirPhzChCHHF
	O4bRa5zLn5jSxPx69ijFgUAOygf/vR1856GbVwYVgDTOu4RYNErSHoFBIiC5V6WnjdG94wSvAlv08
	2xL07YutnDNd4XkXXJSYuZnkh9pRKr7G+ZOHWgUtlbxxPaprUzwxe7OeQCGik02vNHPyOSjKNAcUQ
	pw5LSUlDo8ZDjpgKzOkOMGyIA7e1dZ+cw9cn05qF3egbbyRdpP6hl8BQaDHU3JgPzAalyczeeGbFh
	87OC+404V09PaFz7c96+uFifo25voTpUtwxLzpQm5xt+MPNDFrf+xeDH+T/Wd+nDl6wSzqZwfXO36
	zoadO4SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUfYH-00AY2x-Sm; Wed, 22 Feb 2023 03:12:17 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUfY1-00AXvp-8R; Wed, 22 Feb 2023 03:12:02 +0000
Received: by mail-lj1-x22c.google.com with SMTP id by8so1499357ljb.7;
        Tue, 21 Feb 2023 19:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zNaFMBMYjszLIMNwm9nfdvrGjZqm6B4tt+On23nJyTc=;
        b=fmfGqAOsDB60738L285br04P8DANes2K/Tv98hhNfH3Xs5XYRBCUc2p+WQDyOS5tQo
         Q+LWEA8OJ2xn3yfgz18qSC/ZAD5nDWnuOCxLcXfubd3Knyj3P/zbTYWN6EEaCETRQaAt
         Oc2/tbx1ayiJYK+arqS9gtbTnEIkREJTY37nFJtMWc/h7ur+5VfPHd4aI7sVKBhhQ83o
         napzGAEQZxOmhuEL7mFEiQv4vQpk1uE4P6gUDvzx/rShM1AlMplgP9FF0R+DBm7sqXqA
         /fD42bR1jdlJp1ALlwfRva4IooQa+7i89t0crvWVXIcGJ6wQU2d7ALhE6kgDuIwFHuhb
         KvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zNaFMBMYjszLIMNwm9nfdvrGjZqm6B4tt+On23nJyTc=;
        b=0vjEfCQV/GS8uliZ7aWEFUPQVDa/tCNR75EGo7WjeKn0iEGUt6kBKSoc8vPlcYRyRB
         A4ZHuqBbXdUo3owxekvdGDYUxjc/DkPA2vrESKFENqdrUTsPc7wUyYrTkNDCIjth403C
         nyAC7LU7awrkK2EZQ/Nr2q+UXAEz8x0XFYeqC/Hv6Fv3ZG/YUjeADV3W6cc+TO3NIV19
         QO+/RjGaRBL0TSRrOwzT4nH95lhqFLAijmox59gERclMBKFBfkZGV0Sd5EPZVIcm+0Sp
         qFdvR2Zs5TzgYDGFbNRc3OQoCmEDYwC3qWjP479fmjYYnrDexOQdVUS6wyLmhr5Z5YSl
         c/SA==
X-Gm-Message-State: AO0yUKX3A/RWDDJSb+YvmXmDtmQhtmZHFfadPq9PsQTD7ZSKVk/+UboT
	5TTpHNIkdRgJp2UN9Mbv7nSMDrbY6NyJ7wOdLA==
X-Google-Smtp-Source: AK7set98faJfc/hSpvMVcieQV5UmQYC3dAwOgPi+RRqhZzy/3dex8rxO+fMeXVTDfPdZNOSWUNfwACMIBCXfugtSlOc=
X-Received: by 2002:a05:651c:488:b0:293:4b99:f883 with SMTP id
 s8-20020a05651c048800b002934b99f883mr2205922ljc.8.1677035511982; Tue, 21 Feb
 2023 19:11:51 -0800 (PST)
MIME-Version: 1.0
References: <20230222030427.957-1-powen.kao@mediatek.com> <20230222030427.957-3-powen.kao@mediatek.com>
In-Reply-To: <20230222030427.957-3-powen.kao@mediatek.com>
From: Stanley Chu <chu.stanley@gmail.com>
Date: Wed, 22 Feb 2023 11:11:40 +0800
Message-ID: <CAGaU9a9Yx6DAGpoULJ7j19i+KKAw9iUjeXucH8o3XdHAqDNamw@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] scsi: ufs: core: Rename symbols
To: Po-Wen Kao <powen.kao@mediatek.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
	Bart Van Assche <bvanassche@acm.org>, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	wsd_upstream@mediatek.com, peter.wang@mediatek.com, stanley.chu@mediatek.com, 
	alice.chao@mediatek.com, naomi.chu@mediatek.com, chun-hung.wu@mediatek.com, 
	cc.chou@mediatek.com, eddie.huang@mediatek.com, mason.zhang@mediatek.com, 
	chaotian.jing@mediatek.com, jiajie.hao@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_191201_325030_E6B214A8 
X-CRM114-Status: UNSURE (   7.11  )
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

On Wed, Feb 22, 2023 at 11:05 AM Po-Wen Kao <powen.kao@mediatek.com> wrote:
>
> To avoid confusion, sizeof_utp_transfer_cmd_desc() is renamed to
> ufshcd_get_ucd_size().
>
> Signed-off-by: Po-Wen Kao <powen.kao@mediatek.com>

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>

