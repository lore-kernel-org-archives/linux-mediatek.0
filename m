Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F4AC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Nov 2021 07:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hARZCxKdywDYW8R47QemIxfV0KfU4w5MfLXYH5OuOZg=; b=VwvRRVdBK80Uoz
	88bWqn3YI3NJs8VkNZ/sUMhgdHK62cg5LIaJZt6DB5PkZat7qLELfzGFvYP+oBgoT6GQrIcaQ61nF
	c3WmAwS5py/ecJPviN53dknNn+KSXctF34jjiZGaQjmqE4CpLKhM3om2ZiQNhx2pPykloxkIYKC9b
	Fratyv2rLMOEOgsoksqnRqOh2TSnWlOR7AZ9aPtT8/7cUClolaBz98QAiSun4kswvXn6J7lskD16q
	ardSDpEbQ62GnJEL4i+zEZEtwP+If7jTcueCEQHXzIupRMZglNKAxlK0Ap9TYLFJ87PPhIUSSf0O9
	/I/WDYA39VSXVeFoKmcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mraoE-00HZU9-Hi; Mon, 29 Nov 2021 07:10:42 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mraoA-00HZQp-TA
 for linux-mediatek@lists.infradead.org; Mon, 29 Nov 2021 07:10:40 +0000
Received: by mail-pf1-x42a.google.com with SMTP id n85so15865235pfd.10
 for <linux-mediatek@lists.infradead.org>; Sun, 28 Nov 2021 23:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dTA5ud3pcmUbZ1xE5uOmnFByKDozJrEPV4w4Qk6rIvw=;
 b=c1szrkhypZONQzYZOGrUNlRloRrcF2L0VerJ4UPxjPi2TuZhUKU0jgr/gTlUbZLM6c
 jj1gAFppSlboqFQ6+mIaTw1C9376FU/VOqDtPJ50/9EWgqNnAXsp0eDXry4yKsXcH1TZ
 9KJQ6GKQt+yHZofLWWLw6uVdaUO8Qv26YIaFMmW6GQBEEOrkbW0DukC+6YdjFsxHARuN
 RyfVn5RgaAkFf4SgpGj6zpvBVq/oSvNKP7To1F+ATRbrlPnqqrubhSN9F5wuOg2qqTFw
 PxwaOf9jYFmE3jJqq+b9jm8fo1ZPo/PeHVKX0yb5fNZ6ZdHtWp6rxnMdA6KYON8KQxxZ
 NZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dTA5ud3pcmUbZ1xE5uOmnFByKDozJrEPV4w4Qk6rIvw=;
 b=O3Dh2r3AI6QwZ1eOaE3wWT43Tj56i+eU03devm0wuh/2+GcJXL+EBqzJ4wb5ePsbne
 pBM2ZU1zU8GCVgUDgHnXr4w+R4rNt2WJuE7wXyJkcNqtfnBx4cpyvMDlS3zhpPDDQRFB
 Ri42wV+M6S/U8h1VNeD7hp6cmymQ10HUmbRAfxTwbDJjzqhrFEDc3vNLmRaeZm4xk25E
 4aXPMbYJ30nJpfAlcVJtmRkZmISJAzOQLUvueyoIBK4NVPGQ3TE0d0FFBUy0zcVvCjrf
 49/OXXzw7IwaYGRnXENBQlKCRhB8XYwrweh20xieR5R4bI7VuAv2q1i1f8ZFoUm7HrIl
 S48A==
X-Gm-Message-State: AOAM533697YLhKr/iS/EIWd53LS2WjKO9Ydf91MSiw2A3qp0FmQQdjZ9
 feJH7esztkIoo1nM8ctyNsbO6g==
X-Google-Smtp-Source: ABdhPJxDS9wOvoMttiFLB+55g1aIXEZkM+ZkIlmj4P2bMLUD9Qy8/ZRtRHZfFtAfS5ZDY4pH6Ds84w==
X-Received: by 2002:a63:448:: with SMTP id 69mr9522548pge.141.1638169834496;
 Sun, 28 Nov 2021 23:10:34 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:3807:fdf3:5573:47d6])
 by smtp.gmail.com with ESMTPSA id ip5sm7216948pjb.5.2021.11.28.23.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 23:10:34 -0800 (PST)
Date: Mon, 29 Nov 2021 15:10:29 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, cujomalainey@google.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 sound-open-firmware@alsa-project.org
Subject: Re: [PATCH v7 1/3] dt-bindings: mediatek: add adsp-mbox document
Message-ID: <YaR85TUlOBcMuG2a@google.com>
References: <20211129063954.1616-1-allen-kh.cheng@mediatek.com>
 <20211129063954.1616-2-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211129063954.1616-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_231038_987801_E293D029 
X-CRM114-Status: UNSURE (   9.57  )
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

On Mon, Nov 29, 2021 at 02:39:52PM +0800, allen-kh.cheng wrote:
> From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> 
> This patch adds document for mediatek adsp mbox
> 
> Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
> Reviewed-by: AngeloGioacchino Del Regno<angelogioacchino.delregno@collabora.com>
> Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>

Neither AngeloGioacchino Del Regno nor myself provided the R-b tags for the patch.  Please remove them.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
