Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D93AC072A2
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 02:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5aRkvCfZ5/Ryh8W2QZqJoEImQ16cBLBAJ0eonaFBJv8=; b=lCQ9H+KrUY9+M1jlhN0pnWNtpV
	mSF3xEaq4KzhS1LNgvAnUmF16251IQndOspmhGSvpybgGkOj0cZH1iyUkXfQtx4LQFOTBfHTLb4Ff
	gcZj40YLQ9qf5sT6TrWVw4EOjN1g7kzqPrfFyOJ/dtXtqaCadAkC5ZVjaTeu7W8r3KgZoE3DSr887
	eDfGJLM/6SJFBHp4O3sYZHBWkOOU5SZxl/12+JnCUkjBp8TfNy7DqemoZK9n0DaRBN1wyaWpSCUl2
	VU0CrunwKtBj+15TSq2W+J+urOIrzG34rD4IbCGv//iyZ76veGbAM/+i3ks95TTjTvZn3RJJJ4ppy
	3h+2wU0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3SUK-002GzS-14;
	Thu, 16 Nov 2023 02:52:16 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3SUD-002GyW-08;
	Thu, 16 Nov 2023 02:52:11 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c83d37a492so3901011fa.3;
        Wed, 15 Nov 2023 18:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700103124; x=1700707924; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5aRkvCfZ5/Ryh8W2QZqJoEImQ16cBLBAJ0eonaFBJv8=;
        b=MquQM/T4dD+j6naOzuKCJRJONrWKP9mFqdmyVlhZ2xyGKhKwfIGl4TXho5lQI5+V8p
         RcsE3CklX9rbxGcGP5YCDb5rrCErGTNKZPvEguU4+FxjGBFQsq9Q6ciYUALQbXOZQcVN
         tTj6aORjiETmxNMve14npibH+GvvogR8CQzdg88vhMkgBhv2VYX03MhFYQEww7bkF+nm
         W1rcvArYJMQbYUDjJxxH7i7/V5S1Rt3y4BVd6MMh5Bkzg6M5olPXRTHcW8LvDRr7YzcM
         tDvKS+8ZlnI9vPA7FgUFxDaD9JfBFt5uBlR3GvCymQaK/MzByEqpwPGDny8JmOaMZGZI
         VVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700103124; x=1700707924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5aRkvCfZ5/Ryh8W2QZqJoEImQ16cBLBAJ0eonaFBJv8=;
        b=ctALdR6HEwuwsawW258bNBHjIDJoFgc1o15hVtU+JfFhpwvRoANFI+j0oElyMzV1wE
         zB0eKrSOQzXrtM+Nvo5bJfXDZXuYHD+8MkHtsF0gu9pIasP8+uiqpTqBvBGXWUowWfg1
         MtxvP5Rvi9xfcvn3oTiOXyME9WwElru2anOwbbLnIX5rJc0U9n7U1N4xAee05XeWlqeV
         4seJ985S/w0NFrA5PvwPD45j3wJ9AQwLEj842DPaRkcLFvcLFRo8hnQ2EK9hubg5mAVU
         I34/0wNkkHW79Xz0A33Q82G3AKgUG4BCKk8j+pRAIZfDC38dF9PEbUyykW3a3GFeLGai
         6wRA==
X-Gm-Message-State: AOJu0YwKZCPYGWQyNYQDY6fN4+33gDgs0bxWGaKUawI7XrgkZZXiV8ih
	48nQSPLdYFGVaiGif/yR5f9cMuA1bOqoJeJMFw==
X-Google-Smtp-Source: AGHT+IHY9DZHz+C0W6+qIRg8MLNxJHg85rsBn+iyyJOHU8KW6vrjOm5xBNFzETGp3qvt5P4HThGOgST3nkp9PuO9RE0=
X-Received: by 2002:a2e:9246:0:b0:2c5:1f5f:ed96 with SMTP id
 v6-20020a2e9246000000b002c51f5fed96mr5283168ljg.3.1700103124063; Wed, 15 Nov
 2023 18:52:04 -0800 (PST)
MIME-Version: 1.0
References: <20231116020254.10590-1-chu.stanley@gmail.com> <663b4db6-6c8d-4948-80d0-a7bbf75a33b4@acm.org>
In-Reply-To: <663b4db6-6c8d-4948-80d0-a7bbf75a33b4@acm.org>
From: Stanley Chu <chu.stanley@gmail.com>
Date: Thu, 16 Nov 2023 10:51:52 +0800
Message-ID: <CAGaU9a_PHq+QDSfZu=nBqH1DS4Sjj-oy5178jURjn-owW0-TiQ@mail.gmail.com>
Subject: Re: [PATCH] scsi: ufs: mediatek: Fix the maintainer for MediaTek UFS hooks
To: Bart Van Assche <bvanassche@acm.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-scsi@vger.kernel.org, jejb@linux.ibm.com, martin.petersen@oracle.com, 
	alim.akhtar@samsung.com, avri.altman@wdc.com, peter.wang@gmail.com, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_185209_101393_837DD6B0 
X-CRM114-Status: GOOD (  12.67  )
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

Hi Bart,

I (Stanley) have left MediaTek, so the maintainer information needs to
be updated.

Given that MediaTek hooks are better maintained by MediaTek employees,
Peter is willing to take the maintainer role in the future, and I
would gladly take on the role of a Reviewer.

I will create a new patch for this change, and Peter, could you please
review it?

Thanks.
Stanley

On Thu, Nov 16, 2023 at 10:33=E2=80=AFAM Bart Van Assche <bvanassche@acm.or=
g> wrote:
>
> On 11/15/23 18:02, Stanley Jhu wrote:
> > Fix the maintainer for MediaTek UFS hooks since the origianl
> > email address is not available anymore.
>
> Why is the original email address no longer valid?
>
> How to verify that the old and the new email address are associated
> with the same person?
>
> Thanks,
>
> Bart.
>

