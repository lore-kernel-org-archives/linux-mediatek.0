Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0878AC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 20:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xKQ2vML0E/cGK8VJDMZAiiLvaFxi4ne9XNHTuPf0m20=; b=3elIVGxS0Dd+1f
	wt2KvYViTkISTV9m+Qc2vezQ85kXvFyWkQXib7Q5t2DJn61lRgIr8DfqEcIFXxIY6ng9GwO8Qd+nN
	5tQSM1ufimc2xEnVG73ADMkVYRxnKRk7U+HEL8uL9uRLiHkZoz3cseAKaw3LkyD6Q+JylR7OxmtJh
	2ZsLejdOljxAdODryvwoBCTICRgTLmVy8jx1ywyoY11XGZ7Z1aeJA/oKw7+iLtwOSkUc5/wvm2ex6
	I4DusOr4nIMAt/e3btXatTT6wDJibmVvZiL5pPW+Sap/Ua/thr+tquPxjQCDr9VcIysZy+YyMQTox
	k11+RDNzwbMB0YIQ6nJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK4iz-004a27-Ng; Tue, 15 Feb 2022 20:47:01 +0000
Received: from mout.gmx.net ([212.227.17.21])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nK4io-004a0S-0r; Tue, 15 Feb 2022 20:46:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644957995;
 bh=0OSbOP7dVuxah5dzxOSWPDpWQt+waq4IO/yrm245na0=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=RM8lbqfXj4CquNffPjLDAk/zqsA2R7oPEntJIfErC/JFzifQUKiCCwI3sQ/AwS3UH
 u+PDvEN61F59Ofw1QXdQ7s99jAvoAWJRtsvl3CYAHnhMh1rMymay5Nv8yKR1A9xG1K
 XK+pIDDlkBrtJwgBGiQ/YPmKR4xRWeE8wNcYaJAw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.185.100]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MJE27-1naNTk1Cfr-00KivD; Tue, 15
 Feb 2022 21:46:35 +0100
Message-ID: <7e60cd01-8afc-ddb5-a1bb-6e9f53ccfba5@gmx.de>
Date: Tue, 15 Feb 2022 21:46:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 22/23] video: omapfb: dss: Make use of the helper
 component_compare_dev
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Cc: James Wang <james.qian.wang@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 iommu@lists.linux-foundation.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-kernel@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-mediatek@lists.infradead.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, srv_heupstream@mediatek.com,
 Rob Clark <robdclark@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sebastian Reichel <sre@kernel.org>, linux-omap@vger.kernel.org,
 linux-fbdev@vger.kernel.org
References: <20220214060819.7334-1-yong.wu@mediatek.com>
 <20220214060819.7334-23-yong.wu@mediatek.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220214060819.7334-23-yong.wu@mediatek.com>
X-Provags-ID: V03:K1:MjTT6/0mKscyzurmEJq+TRDLFWm722/o5oh1VceIWTDo9Su6z33
 Uqcw4r79WPXMZ1MHVQ5YZwMpT3/LUtQYuMEKT1s4Qsw268nztXs8M1PHTdwFSaaX3fRCVHa
 I5hj8j+9RzGYlu8e8qiZ43jIdVRKdmD+CGxvzWPF1Cw57f4/4D8ejp1FysOEiqU6iTGSqwc
 ErfKQfh2UKAhLIHNSceWg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EO1+Ylb+ev0=:HpXUahwDBxS2Q6GJ/UdQMa
 n+62M3husXUXoHxxs8AxzjuuYDkqIBegYnyeAV7YgP0Mle0rT21+2LEV21Cm/oK+NdFah8S9W
 CpzPyAZIRuU01jq211YudtbXnvFOMgwbjvey4rIl2NTTJUDs+3nbJ6EgXSJwHO77nbgaCNttA
 G+VtN7qVCXCtu780Msj9tZjo7C1oDNvtl1Z0DVM0OdyjyuO5D93T57PbebQJO+46L8tQ0bfg4
 PClJhDBMO98xxmJRVp6iBSjNS7q7geteQaZ0ZJQVZhNyuKpKUNS7ESMvNsPEhSTzcXNJDdgSx
 Vq9g3AnCPk01P40v1QI4BqRKbdc93kQn/QMzvwnd6VKhhT5hOO0TqppV8u07Mwhznrax7VcRW
 +v1Ixw3WjKmrwEdG4wxBOsqT1dFC/6QoqorX3z1sqp7Ag6Ncwj2vZEjoNZ1YUThIr4BpD/vWq
 hjpVXVTw/vir74eHyvdnz2eZXfQD7YPWYiK3z1oTwSGkoUciP9hPqvp4WS1qWPD3Wx4UiMz4y
 2dpK2641P1xHzfATt1y9hhMgc6vt9XFxpm9Ycl0uN+Nf/W9WIYa2fD+vPujh/CyO3jLklKrNP
 rhbT5NjDJGfC/AFaC2iH75aCY+P5r1pQZOBnvTunjmLUTuER4bhCqMQqM9G+WAIVA1mScRE7x
 z5RtmJWkKSwplc9SI/e09hsIAALu0cz7R3+T3vF1BUPB0RwiiTFPg2EbSOsu0l9GrJ8CkvoHP
 6ajgPfPMXcn62tOWZWD9MMtunWjyjGeCeU0sZsO37FBgxO6O75XX5KNPo3ZtVKQ/rb45z2Rj6
 BmFoOKHsV5p6ypFwr9d2I3zNEcl0DYDNBnMwKA/3QTkYeOJgYkBDK8DU7dxFOUM6q9OWcMRcY
 NoMQI8g/0H0GxrMHZA3BmETGV399e4Ve0zB9yhBv/cd9YdH0LKj0wm2/KEIbC/oPNQrOB040l
 zX8J1rybbjKBBzimlhU2e1yTmGHdV4geJl204qxFdDOHSN0uiAnzvI89ljAQcys4MdV9EpQSa
 NnChsjeiQrZB5ZntJzdsbaO7RJJahTHLc0+epBUeuUd6C0orPGZgiQsH8Kwcy4p8Uu6vZoYIV
 JC4pPsVjDwiUHc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_124650_401884_428FD413 
X-CRM114-Status: GOOD (  15.95  )
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

On 2/14/22 07:08, Yong Wu wrote:
> Use the common compare helper from component.
>
> Cc: Helge Deller <deller@gmx.de>
> Cc: linux-omap@vger.kernel.org
> Cc: linux-fbdev@vger.kernel.org
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Applied to the fbdev for-next branch.

Thanks!
Helge

>  drivers/video/fbdev/omap2/omapfb/dss/dss.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss.c b/drivers/video/fbdev/omap2/omapfb/dss/dss.c
> index a6b1c1598040..45b9d3cf3860 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/dss.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/dss.c
> @@ -1193,12 +1193,6 @@ static const struct component_master_ops dss_component_ops = {
>  	.unbind = dss_unbind,
>  };
>
> -static int dss_component_compare(struct device *dev, void *data)
> -{
> -	struct device *child = data;
> -	return dev == child;
> -}
> -
>  static int dss_add_child_component(struct device *dev, void *data)
>  {
>  	struct component_match **match = data;
> @@ -1212,7 +1206,7 @@ static int dss_add_child_component(struct device *dev, void *data)
>  	if (strstr(dev_name(dev), "rfbi"))
>  		return 0;
>
> -	component_match_add(dev->parent, match, dss_component_compare, dev);
> +	component_match_add(dev->parent, match, component_compare_dev, dev);
>
>  	return 0;
>  }
>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
