Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CDFC36010
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Apr 2025 14:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FNL+NAWFI0GxoBJ167yJeoBFSWA7FvYgScloIAzLUeo=; b=NzUbwaM9sWlc02pvtQSZnxnIW5
	his5Os3X0beJy7kiK2IQW+PKKqwysiARuJ6xPrfu7rznAeiopGrN2XZ+yJLFQLpbkVgL9u1HndNvj
	jRT/6qLbt15y+0Ems02tUKskt+e5KkvExLUVodKDKyWgbcsvZuqjNBzIya7xIdkfw4H9JI49LzEkv
	owxAdhaKHvcasP8cqRRlewL5j8FWwgHvwO+oXe7Cof1XatUCq3As8ED0MsryaKG50PAqE6HaNsT0K
	bIByoXtGW8IFvc6yCbpTiwp8PVS19bi5TeCqY2o0FRL4d5m7ebaa6bXaj8rDLL0gpgW0rC8jMr34z
	H5tcEunA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1noa-00000000oTJ-2ntb;
	Mon, 07 Apr 2025 14:51:08 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1nP3-00000000iIp-2Pm1
	for linux-mediatek@lists.infradead.org;
	Mon, 07 Apr 2025 14:24:46 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4766631a6a4so44284201cf.2
        for <linux-mediatek@lists.infradead.org>; Mon, 07 Apr 2025 07:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1744035884; x=1744640684; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FNL+NAWFI0GxoBJ167yJeoBFSWA7FvYgScloIAzLUeo=;
        b=Vr6bvQB1sSWh2KRAsMWfws/QK1RtXVDFRkD/FfbghQvVBBzlJbktBvTtbhkW9ivRvZ
         ScOOYqb2m0JkLJ2ne987qctqQxCntroJbesKEB0tntYf9XhlnHHtgMdOUBpcUffnrPyC
         Efh2Bqwla88sjpNLARN0Hz4PjyECJQ71VJkXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744035884; x=1744640684;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FNL+NAWFI0GxoBJ167yJeoBFSWA7FvYgScloIAzLUeo=;
        b=mzHezjo9Esm3cjfZ9OQqTxNd5sZ7Bq8cjpR2VahVtKcKQ+ZwoiSp+Sx9NOlZahXo49
         DQfQPuPWnjvBivwBQJgAAxvynLqbocFn2CQdzuPn5yghrL1IYXADqlZ8xOIk7+VKn08M
         JQZq4EcgJ8HW+izD+IvdLu0720xZp80bVG1B0YiG0CBHw6l8JV+oUxB4JYb/SX50qXci
         y0DMKDLjXGPHKfHWhUGyVfdPzRyaWSpnsgJJN7VGGoD2rb88ilFIFxE44UTy1bfkcnS6
         R/8F5b+FxXch1/AF1tM9LsthSbf3U8Ci+jELYrDLvaY/8qdqU/nzJeJ/a9HVzFc+kMcX
         6+ww==
X-Forwarded-Encrypted: i=1; AJvYcCWNCWOWPE7E1I+UsJ7ICH0r5FTROOSwDVUyQ30bJKSRqiHK6X7FsbfqzbrlF4hsz/0QkI0+fEsicfS5RpCyxA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yys8+Od9vMDkb8apIweuT0jiOBeqItn87A9joSo9zfV/6EvrHFi
	PoeMNhguHWFrDvZQy7bleMKSfH1bDPSdkpAJzkRI8RVrKlWo+1H/y0LrPwREuTtBULautMH+TW8
	qsLNdBUDUgjt4/OrAm0hqqqajnAFK3DDibExyIQ==
X-Gm-Gg: ASbGnctIK96grpChrAulXJ3hBxJf50P7XIdmn1K8bxUMvgk8Sqqb426nbtMRtkWIWZ2
	UslvQQNI0u5OfqYu5aUa7VR37TINYp6l2dgpktB1uNRUAtnClbdXwxDcNXNQPJpM0iT4cH1Ah+Q
	bEVV5Np6f/p0mvRWaUpMsUE6J6EOM=
X-Google-Smtp-Source: AGHT+IFQd4jHNyMbSuzJ059jvOO/iExVzCO/KphR667EKFZiLjHNp+k+91snAGwPCrKp9DxvzNZfuI0F/c1qQXQ410A=
X-Received: by 2002:a05:622a:199f:b0:472:bbb:1bab with SMTP id
 d75a77b69052e-47930fe7403mr104524641cf.24.1744035883851; Mon, 07 Apr 2025
 07:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250407115111.25535-1-xiangsheng.hou@mediatek.com>
In-Reply-To: <20250407115111.25535-1-xiangsheng.hou@mediatek.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 7 Apr 2025 16:24:32 +0200
X-Gm-Features: ATxdqUEaLGT2M3QdvlukIOwAEuscXulm8_kXjOV6iVYrWf5p1vewCG0W1HdKGiE
Message-ID: <CAJfpegsN47xDbVFsu=-TLW+A2=-33fNY83zt5bhebFqH67LAVA@mail.gmail.com>
Subject: Re: [RESEND] virtiofs: add filesystem context source name check
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Cc: Vivek Goyal <vgoyal@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, eperezma@redhat.com, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, virtualization@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	benliang.zhao@mediatek.com, bin.zhang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_072445_624576_BC73FDC6 
X-CRM114-Status: UNSURE (   7.94  )
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

On Mon, 7 Apr 2025 at 13:51, Xiangsheng Hou <xiangsheng.hou@mediatek.com> wrote:
>
> In certain scenarios, for example, during fuzz testing, the source
> name may be NULL, which could lead to a kernel panic. Therefore, an
> extra check for the source name should be added.
>
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>

Acked-by: Miklos Szeredi <mszeredi@redhat.com>

Thanks,
Miklos

