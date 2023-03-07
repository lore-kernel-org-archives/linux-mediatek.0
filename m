Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81677C678D4
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 10:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KK6+pmxlkkVYq1/dWLbdAI6eiiQIn+ylv2hMdBqK3+E=; b=ctdS0be9fgwE+O/Z0OANHIIWY6
	80UgxJttV5qPrzCQo8bU59/B/6I0tWjiIpTaPkMxmxLSJAkoSWGSz4/kznA1SwRY3xkc92c9LU3T8
	ewADzamO7/YRG5lZNTt7chq+rOJ8sn983gz+dOxEs7mU9xZD3r4BepUD/0Rd2F85Yej19qRdkoajE
	m1y/EN6gZDZrDdejmLvTYibY52803jDuFRVdj8Po18HhrBSX83Fa74SdkidqIOHqtY1mFzJw0hMms
	Vyi7DfpYJ4owB/KFSnS2+swlfEjhF1ztly6nL5q1VYE7z/MNcVmD9htyuTK01MfbWt9wQab4mWApS
	NlTsofAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZUuE-00HMNN-Ul; Tue, 07 Mar 2023 10:50:54 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZUuB-00HMLn-M7
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 10:50:53 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 82so10944197ybn.6
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 02:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678186248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KK6+pmxlkkVYq1/dWLbdAI6eiiQIn+ylv2hMdBqK3+E=;
        b=ZV8QkZxiPpht74gPwYBgIZqWLanOR7Hh9l9ufs6DkGmYq/8/bJXfM6oqkXXEdVwcWv
         X5NPGxA1kIUpnj/Bfp6BKBMPHFt+GLkWuMR4fT3P7+PTUZpMkOhY86v5QSk97k8TxFSW
         HVEjQ0Xf5gfKAJyeSrVqo7SSJyew70fyAS7PMjw8//51x0J5EkHaKOA4C8qchRNzkSuc
         QUs0sscP0NJyXwCm4jiTqyde1HJPr69AOmybk6EQ0jwwbdnhT08eDXV+EMgwtMAi3P3N
         vQdM1KeeF21KslFm19BYz8ep+peLxy0jzQf3ewCfoHeXbcAiAQV3R1NY6tGGHjbaZ8N4
         IK7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678186248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KK6+pmxlkkVYq1/dWLbdAI6eiiQIn+ylv2hMdBqK3+E=;
        b=Ssb482oeFDavvlaXPiGSDofl/cvOa3ML42r80/HKISmLNO1U6MQ+JRAwX8VY69SGxz
         6wYq81uPYUf3xZXyxjD5IpmV0QMBv5JDzkzzNs3wmAn59OplqqpVONR9qxeQxOrs73IC
         WGpq9aXi9bHGVct5XfSu2y8I98bbmkqdXYWknbkTlg7CvrxThdFYk9BNoMlgWKTTGgma
         Hdkk1iDD1IXVqJny2I9eLD2kxwTnyICYPd1J/bRlTByYWaYNaxbd2shXrueT2KcPczYt
         thFmJ+oB8d2QOMBECg2aJzGlOKYQr7mc3bX4D8IlsYxrY4iSUXsbFs8NPtpoY/o/P3mw
         mtPQ==
X-Gm-Message-State: AO0yUKU5TLvuk+RnVD+5CPjiuBRSS+5fLi0ea7ff2MMZLF9iLTlesfJB
	fWjnq7DSoaVraCq2gYMBkkx1qht13plU2YoQHfjw/g==
X-Google-Smtp-Source: AK7set9JDVjFHts0EtGNNbzx363IolKWS/zKlAGLFGrtJWNK3ZkAp65ZtKiRq0kW2AbaXZQtaHuWGwc6Ba8iPUzjwqY=
X-Received: by 2002:a5b:c51:0:b0:91d:98cd:bfe4 with SMTP id
 d17-20020a5b0c51000000b0091d98cdbfe4mr8506651ybr.10.1678186248559; Tue, 07
 Mar 2023 02:50:48 -0800 (PST)
MIME-Version: 1.0
References: <20230306-ccorr-binding-fix-v4-0-117daea88efb@baylibre.com> <25019fb1-87f7-b863-48e8-a164d0e08265@collabora.com>
In-Reply-To: <25019fb1-87f7-b863-48e8-a164d0e08265@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 7 Mar 2023 11:50:37 +0100
Message-ID: <CAFGrd9qV40Re=bJY-kToAcYcv+d3nBje-zxxKcsvwfiE1a9OjQ@mail.gmail.com>
Subject: Re: [PATCH v4] dt-bindings: display: mediatek: clean unnecessary item
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Vetter <daniel@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_025051_738860_34A53690 
X-CRM114-Status: UNSURE (   8.17  )
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

Hi Angelo

Le mar. 7 mars 2023 =C3=A0 11:17, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> a =C3=A9crit :
>
> Il 07/03/23 11:07, Alexandre Mergnat ha scritto:
> > The item which have the mediatek,mt8192-disp-ccorr as const compatible
> > already exist above. Merge all compatibles which have the same fallback
> > under the same item.
> >
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>
> Alexandre, the Acked-by tag from Krzysztof goes *after* your S-o-b :-)

This is managed by the B4 tools.
Also, I know this is an unsolved topic in the community, but I agree
with people thinking the last trailer must be the guy in charge of the
commit.

