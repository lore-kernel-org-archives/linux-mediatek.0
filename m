Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 649DBC10F1A
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 May 2024 07:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yjn42W/o/LOj/jSJgIWj/Vg3N4yLF7R5ejTMZiQDXvM=; b=1piJgAP/I2+YnE9TLZPxzi9sfd
	Sx+lvb/eRVwwyheFX7cW0aqZOEYNZo2S9Vn8ghhIIcln3ZN2SNjfCe2ZG+yS9rTf1GtUtQ5F0StGc
	rRgZuoCeDndL0gLVbozC4nNHDmai7d5bQPnFxE7yNGecsTDg7DRYQuCVysvEo+XyEAOL/GQx/3lRz
	Ot8ziy8uBg+Gz59Rr3ao61miqbR6w8utW2WwIm/Pcbiz+XQffXDQayvP8us8TGWJJGgat7LG/7Zt3
	GTps88L2Mto710uUJGWEzg65TAsH5AxchEXvnYfA63qo2xU9o/3Fo2hlbOoZkMa3hcAklqjByu64A
	bTYAk6gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4ygh-00000000l5w-2b4b;
	Thu, 09 May 2024 07:59:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4yge-00000000l4Z-0Wjn
	for linux-mediatek@lists.infradead.org;
	Thu, 09 May 2024 07:59:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715241569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=yjn42W/o/LOj/jSJgIWj/Vg3N4yLF7R5ejTMZiQDXvM=;
	b=Ug9yakA99tM6TscDHY6KklxHdNYcGoS/n134dxw1o4+/R31QIFjp3nIBAjhBEVAKXjctWR
	mdKP/0G/r6rDhUrMDsN7Md/fJcHuHVFo5oBFxs3u4a6zKMiCoS1htVmhq9f4IZ1emhfh3v
	VewaCPuqhpKt+Mpswq632taG6c+wjNc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-OWQRcVR3M9ai40py-R61Hg-1; Thu, 09 May 2024 03:59:27 -0400
X-MC-Unique: OWQRcVR3M9ai40py-R61Hg-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-34d92c4cdd9so87449f8f.0
        for <linux-mediatek@lists.infradead.org>; Thu, 09 May 2024 00:59:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715241567; x=1715846367;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yjn42W/o/LOj/jSJgIWj/Vg3N4yLF7R5ejTMZiQDXvM=;
        b=nXjX6aGWfWPL6zFAOqiM3M+cvKFi2HdftVcDBFSkozPADsLn4LLTKTODpq8fbSiB7W
         tLbcFPNaBQjeHW7+Iu7i58BO89BTQAvhrqd+lZZHrYtu72NEUgzJ5HSwONPnD5uvuWR/
         spKujGRheViYX0zEfXzEUOwyYp9MZmRWgSUxineC1QK4vOovCDRKCUSMmARUiRjsB0dt
         MPeQgdaTSG+/veDeJ9hviNXnPGYzH/6LVmbZu0PGEB67CBMqlvHioEaTWvJpjBW9Q8IE
         JV8AtlAK04n0Un66PDI4WnIm6gXXCmHTgsa7oOSS3o4B5l9kPuQqWD/C5/CnYnZnXm6b
         agtw==
X-Forwarded-Encrypted: i=1; AJvYcCXs+DT25kh2o9eFfug7L2L3pbDEf+q1nZ7SY94xO4E+Mzg0ZIePnXW2qDPMB4HUGRNntcV+oeq6VOsrFagEUUXPai16l5/7y3E8kQ1ELzV9N3Yp
X-Gm-Message-State: AOJu0YxGPsN4bYO2hai1+H/E11WsIWgQfHYiG8SX0yf+wHMdQ4gX/QWZ
	NVUXQFuCfHkvjjMkYjCpS3UPlYuPepWfHQHZoEuo09wZrbICaLL6zwEnL4Hv9+y7c9ejzDenk0k
	hPbH980X6wPQW6cScfP+AqpYMsI7ku8W75vm0zn2xgjqhHmvWsEJ//ixpaMI4pOJkVl412w==
X-Received: by 2002:a05:600c:b44:b0:41f:cfe6:3648 with SMTP id 5b1f17b1804b1-41fcfe63810mr6921675e9.1.1715241566731;
        Thu, 09 May 2024 00:59:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwrk8LgSZgMX3L0wE/e/4bo7w9alQYn6RfI6mS+/NPJ8rwhS/tbGTF5kFnddiBXFQPikowKA==
X-Received: by 2002:a05:600c:b44:b0:41f:cfe6:3648 with SMTP id 5b1f17b1804b1-41fcfe63810mr6921195e9.1.1715241566345;
        Thu, 09 May 2024 00:59:26 -0700 (PDT)
Received: from gerbillo.redhat.com ([2a0d:3344:1b68:1b10:ff61:41fd:2ae4:da3a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccbe8fb5sm15844475e9.9.2024.05.09.00.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 00:59:25 -0700 (PDT)
Message-ID: <e9633d41d0d004db3ec6e2b6d9dcb95d029dbb94.camel@redhat.com>
Subject: Re: [PATCH 1/1] [RFC] ethernet: Convert from tasklet to BH workqueue
From: Paolo Abeni <pabeni@redhat.com>
To: Simon Horman <horms@kernel.org>, Allen <allen.lkml@gmail.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Allen Pais
 <apais@linux.microsoft.com>, netdev@vger.kernel.org,
 jes@trained-monkey.org,  davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, kda@linux-powerpc.org,  cai.huoqing@linux.dev,
 dougmill@linux.ibm.com, npiggin@gmail.com,  christophe.leroy@csgroup.eu,
 aneesh.kumar@kernel.org, naveen.n.rao@linux.ibm.com, 
 nnac123@linux.ibm.com, tlfalcon@linux.ibm.com, cooldavid@cooldavid.org, 
 marcin.s.wojtas@gmail.com, mlindner@marvell.com,
 stephen@networkplumber.org,  nbd@nbd.name, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, lorenzo@kernel.org,  matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com,  borisp@nvidia.com,
 bryan.whitehead@microchip.com, UNGLinuxDriver@microchip.com, 
 louis.peens@corigine.com, richardcochran@gmail.com,
 linux-rdma@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-acenic@sunsite.dk,  linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org,  linux-mediatek@lists.infradead.org,
 oss-drivers@corigine.com,  linux-net-drivers@amd.com
Date: Thu, 09 May 2024 09:59:22 +0200
In-Reply-To: <20240508201654.GA2248333@kernel.org>
References: <20240507190111.16710-1-apais@linux.microsoft.com>
	 <20240507190111.16710-2-apais@linux.microsoft.com>
	 <Zjp/kgBE2ddjV044@shell.armlinux.org.uk>
	 <CAOMdWSKfkT4K9MAOn-rL44pycHPhVDj4CtiYkru5y_s0S-sPeQ@mail.gmail.com>
	 <20240508201654.GA2248333@kernel.org>
Autocrypt: addr=pabeni@redhat.com; prefer-encrypt=mutual; keydata=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
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_005932_245242_071F00C0 
X-CRM114-Status: GOOD (  10.45  )
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

On Wed, 2024-05-08 at 21:16 +0100, Simon Horman wrote:
> * As this patch seems to involve many non-trivial changes
>   it seems to me that it would be best to break it up somehow.
>   To allow proper review.

I would like to stress this latest point: it looks like the changes to
all the drivers are completely independent. If so, you have to break
the series on a per driver basis. Since the total number of patch will
be higher then 15 (maximum size allowed on netdev) you will have to
split this in several smaller series.

Beyond making the change reviewable, it will allow eventually reverting
the changes individually, should that cause any regressions.

Thanks,

Paolo


