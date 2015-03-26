From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 03/13] thermal: remove useless call to thermal_zone_device_set_polling
Date: Thu, 26 Mar 2015 16:53:50 +0100
Message-ID: <1427385240-6086-4-git-send-email-s.hauer@pengutronix.de>
References: <1427385240-6086-1-git-send-email-s.hauer@pengutronix.de>
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1427385240-6086-1-git-send-email-s.hauer@pengutronix.de>
Sender: linux-pm-owner@vger.kernel.org
To: linux-pm@vger.kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Mikko Perttunen <mikko.perttunen@kapsi.fi>, kernel@pengutronix.de, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: linux-mediatek@lists.infradead.org

When the thermal zone has no get_temp callback then thermal_zone_device_register()
calls thermal_zone_device_set_polling() with a polling delay of 0. This
only cancels the poll_queue. Since the poll_queue hasn't been scheduled this
is a no-op. Remove it.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/thermal/thermal_core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
index c735ac4c..dcea909 100644
--- a/drivers/thermal/thermal_core.c
+++ b/drivers/thermal/thermal_core.c
@@ -1571,9 +1571,6 @@ struct thermal_zone_device *thermal_zone_device_register(const char *type,
 
 	INIT_DELAYED_WORK(&(tz->poll_queue), thermal_zone_device_check);
 
-	if (!tz->ops->get_temp)
-		thermal_zone_device_set_polling(tz, 0);
-
 	thermal_zone_device_update(tz);
 
 	return tz;
-- 
2.1.4

