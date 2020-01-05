Return-Path: <SRS0=jjMD=22=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B53C33C8C
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jan 2020 11:06:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E663F20866
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jan 2020 11:06:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t14aY0/h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E663F20866
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l3DMQ+uUzMJqEs3WUGhGu3QUdS5ZtL4Zzg6ItKcUfxw=; b=t14aY0/hjv+2do
	lHDZ8OaNdOVK3y+brtLcTn8liFEClPngjhSH7+SnsbJeTuTzCzxye57+djRLBdy81JDF21NnHkWaX
	F2olWn+TdsW1eZql1NR4BLIY1JLHBDt341oxeQTX+0FvEQubITgbwBCCYpL+4oFUTpvFtC0dHSvVg
	Ex1JH9aJlzET5I1WI32pQUuhhQ6VbP6lB5CMI/ZW1G2WOtaEz8J3okAUOPEeMG9rmql4KlJkc75ro
	LIRKI1iDazbMmXeByqFJ5kvwgoYvTKGfI/wId/QFGqp53uLMz9U2NIIFRBanv3ejiaANdMJwQ6tza
	6ea92L5dVt4EzPd+2liA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1io3jj-0003AS-4Q; Sun, 05 Jan 2020 11:06:23 +0000
Received: from asavdk3.altibox.net ([109.247.116.14])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1io3je-00039w-LV
 for linux-mediatek@lists.infradead.org; Sun, 05 Jan 2020 11:06:20 +0000
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id AE11F20054;
 Sun,  5 Jan 2020 12:06:09 +0100 (CET)
Date: Sun, 5 Jan 2020 12:06:07 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v7 0/8] add driver for "boe, tv101wum-nl6", "boe,
 tv101wum-n53", "auo, kd101n80-45na" and "auo, b101uan08.3" panels
Message-ID: <20200105110607.GA3309@ravnborg.org>
References: <20191012030720.27127-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191012030720.27127-1-jitao.shi@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=VwQbUJbxAAAA:8 a=QOvxnjmS4eJAzMLy2VwA:9 a=CjuIK1q_8ugA:10
 a=E9Po1WZjFZOl8hwRPBS3:22 a=AjGcO6oz07-iQ99wixmX:22
 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200105_030618_887428_4238070E 
X-CRM114-Status: GOOD (  10.53  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: bibby.hsieh@mediatek.com, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, stonea168@163.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cawa.cheng@mediatek.com, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, ck.hu@mediatek.com, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Jitao.

On Sat, Oct 12, 2019 at 11:07:12AM +0800, Jitao Shi wrote:
> Changes since v6:
>  - fix boe_panel_init err uninit.
>  - adjust the delay of backlight on.
> 
> Changes since v5:
>  - covert the documents to yaml
>  - fine tune boe, tv101wum-n53 panel video timine

I finally found some time to looks at this.

The bindings does unfortunately not pass a dt_binding_check

I had to locally do the following to make on of the bindings pass:
diff --git a/Documentation/devicetree/bindings/display/panel/auo,b101uan08.3.yaml b/Documentation/devicetree/bindings/display/panel/auo
,b101uan08.3.yaml
index c0939f8c7274..cafa870120fb 100644
--- a/Documentation/devicetree/bindings/display/panel/auo,b101uan08.3.yaml
+++ b/Documentation/devicetree/bindings/display/panel/auo,b101uan08.3.yaml
@@ -11,6 +11,9 @@ maintainers:
   - Sam Ravnborg <sam@ravnborg.org>
   - Rob Herring <robh+dt@kernel.org>

+allOf:
+  - $ref: panel-common.yaml#
+
 properties:
   compatible:
         const: auo,b101uan08.3
@@ -33,6 +36,8 @@ properties:
   backlight:
     description: phandle of the backlight device attached to the panel

+  port: true
+
 required:
  - compatible
  - reg
@@ -46,7 +51,9 @@ additionalProperties: false

 examples:
   - |
-    &dsi {
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
         panel@0 {
             compatible = "auo,b101uan08.3";
             reg = <0>;

I will follow-up with review feedback on the drivers later as time
permits.

	Sam




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
