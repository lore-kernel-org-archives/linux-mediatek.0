Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06250C28B20
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Mar 2025 10:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yVEU9Z9Cc8B9W4xNNyEcyh6tlvqC6ybG2jaMWegweJs=; b=YKAkoQ4DWTms5iY/Wos3UcVoUs
	IxHYiF5HfGhY7N8XvgIyl3fdJPAutNAh4m3lFyT7OFmRi4FZmK69KBX8uFo4QSJgpjz1fQ+imRpP5
	FMPqZO9teqZZfJpFlIEmgtuRGYyoTAp2cKOHqvW1S0Re43Bx2EkqwnsGdqDwgH/IK0T0mtvDVnH67
	bsxYOt46Jp9xHgiB6Yx5x9A/MQjKPCTAFTDdH4yWPHTbb9GqOtcsQwcygDUjA9ZDXKmCWlC6Yz03A
	E7X2KD5uZ+xNUggNSgFYfv7qmJF92yx3O59vIvUGQvSAk9rxsOWHrMXcY67av6KfLJrVazUbTlwAd
	4XrxABGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty6bL-0000000D5VK-43b5;
	Fri, 28 Mar 2025 10:06:11 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty6Za-0000000D57J-3LmE
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Mar 2025 10:04:23 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-54af09697f5so1860657e87.1
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Mar 2025 03:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743156260; x=1743761060; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVEU9Z9Cc8B9W4xNNyEcyh6tlvqC6ybG2jaMWegweJs=;
        b=QLvAVmqKeIiJSbaffybLYGdlOA9eQu9T6BTThwWOuPiOHl7Av1aUMP9CZicPvjmvbI
         nHy3OXXdS4XtG91RGXBokAKZqck8rcN8vubyS9UKpxl1HYcgY2NZoCjD6QrQI5V8Kzev
         5sJhb2mmQOLFYBthDzVgV6JuS7yVQIObENv5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743156260; x=1743761060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yVEU9Z9Cc8B9W4xNNyEcyh6tlvqC6ybG2jaMWegweJs=;
        b=Reev7n9wanUiUyd3zErjs+vwShsLeUjhvtyrKcd4fvtZij0uFRyypevj8zgVKdp6/p
         SmsXQsbzaBClnVC9+p1RBRVMK8S5XWz30uhFWmM6/8kdZm03edfVbIfp2tOBeoS9My1Q
         +h6K36cf6OiJ+bKLsI32uOsBSj1eQM3hyYcQbrpygbThrlCgEKY+3cRIKNBk97Uab7d2
         hbQeLig3j/NCyv+gknqtmxuQE0yBq072UXv2ZjQgbSF6QOYTAwylWU25lJfwH9D4RdKE
         CLAX1WW/uQVqyliAE1THW0hJ4YcczmUAfAdAvGiesK+hdw1xb54qSmqyDnPycig7jCNB
         cLXg==
X-Forwarded-Encrypted: i=1; AJvYcCVb0LZ/xFMnfoyZJe3rgHvxP0ck59R/oBUI8rX4PxeFqTg44PmtudOZxfNuyopYPfL/WuHO+UaKbTJimzUyUQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxzZ+p1H0gkZ2KicLiyNbwl+1B+coawmDQ1a0Bsa6yZppxDcvnp
	25UY3VHMxBgz/qSFlGlKDSofS4smR5ODnAUSA1AuHxrmqEUIHPbT62p/8PgUHM+R4F0pZxTaP6P
	tTNT9vcZWQ7Ekkw+1zZNVXsEVR1zYvR3WFl9n
X-Gm-Gg: ASbGncua6mh9j2L11godh8WhzcET0RKWe9Nvn0rGfjTmGkwiYgq3aqMlv5EoK8+3T9w
	bg1zsn6eG/pEgfgVooac2QhIE/5mAqwesLhhyBIvjAhetxv4raOYefXA2a+qPJS/BWj93uzHbzC
	g2DN02yMQce+PHA05Z0Ds9XUX93lDrYg/xRLBUV8XnOcDarm81/hV51A==
X-Google-Smtp-Source: AGHT+IHePVtXJ1qJQdbP4+JraAsng3JxPcp8ln2qAoF7z/+m2DWfYuVxIC5W1TfslB1L3LezP+QcBUJ4Mmt/gRVxkjw=
X-Received: by 2002:ac2:4e16:0:b0:549:7145:5d2f with SMTP id
 2adb3069b0e04-54b01221f44mr2788893e87.33.1743156260501; Fri, 28 Mar 2025
 03:04:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250327-fix-mtk-iommu-error-v1-1-df969158e752@collabora.com>
In-Reply-To: <20250327-fix-mtk-iommu-error-v1-1-df969158e752@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 28 Mar 2025 18:04:09 +0800
X-Gm-Features: AQ5f1JruRldxLi3oN3F4vGRjnP_jRoig-8O423pVAOXUeHgChYU13ECJHzNzG14
Message-ID: <CAGXv+5HAa0-AXg6=htNappreR5-9sPHNp7L9ByEBq4XZxADBXw@mail.gmail.com>
Subject: Re: [PATCH] iommu/mediatek: Fix NULL pointer deference in mtk_iommu_device_group
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	"Rob Herring (Arm)" <robh@kernel.org>, kernel@collabora.com, Joerg Roedel <jroedel@suse.de>, 
	Jason Gunthorpe <jgg@ziepe.ca>, iommu@lists.linux.dev, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_030422_828951_BAD154CE 
X-CRM114-Status: UNSURE (   9.29  )
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

On Thu, Mar 27, 2025 at 6:48=E2=80=AFPM Louis-Alexis Eyraud
<louisalexis.eyraud@collabora.com> wrote:
>
> Currently, mtk_iommu calls during probe iommu_device_register before
> the hw_list from driver data is initialized. Since iommu probing issue
> fix, it leads to NULL pointer dereference in mtk_iommu_device_group when
> hw_list is accessed with list_first_entry (not null safe).
>
> So, change the call order to ensure iommu_device_register is called
> after the driver data are initialized.
>
> Fixes: 9e3a2a643653 ("iommu/mediatek: Adapt sharing and non-sharing pgtab=
le case")
> Fixes: bcb81ac6ae3c ("iommu: Get DT/ACPI parsing into the proper probe pa=
th")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Tested-by: Chen-Yu Tsai <wenst@chromium.org> # MT8183 Juniper, MT8186 Tenta=
cruel

